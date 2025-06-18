#!/bin/sh

HOST=95.217.163.246
ICON=" 󰣇" 

if ! ping=$(ping -n -c 1 -W 1 $HOST); then
    echo "$ICON ping failed"
else
    rtt=$(echo "$ping" | sed -rn 's/.*time=([0-9]{1,})\.?[0-9]{0,} ms.*/\1/p')

    if [ "$rtt" -lt 50 ]; then
        color="ffcc99"
    elif [ "$rtt" -lt 150 ]; then
        color="99ccff"
    else
        color="003366"
    fi

    echo "%{F#$color}$ICON%{F-} $rtt ms"
fi
