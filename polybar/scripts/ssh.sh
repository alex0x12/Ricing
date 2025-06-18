#!/bin/bash
DEV=$1
ICON=$2
[ -n "$(lsof -Pi | grep "^.*$1:\(22\|8022\).*$")" ] && COLOR=ffcc99 || COLOR=99ccff
echo "%{F#$COLOR}$ICON %{F-}"
