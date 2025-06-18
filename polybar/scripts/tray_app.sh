#!/bin/bash
[ $# -lt 2 ] && exit 
app=$1
icon=$2
[ -n "$(pgrep $app)" ] && color=ffcc99 || color=99ccff
echo "%{T2}%{F#$color}$icon %{F-}%{T-}"
