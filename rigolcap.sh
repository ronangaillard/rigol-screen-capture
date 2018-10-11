#!/bin/sh

if [ -z "$SCOPE_IP" ]; then
    echo "Need to set SCOPE_IP"
    exit 1
fi

if [ -z "$1" ]; then
    echo "Need to pass filename (without extension) as argument"
    exit 1
fi

echo ":DISPLAY:DATA? ON,OFF,PNG" | nc -w1 $SCOPE_IP 5555 | dd bs=1 skip=11 of=$1.png

open $1.png
