#!/bin/bash
[ $# -lt 2 ] && exit
color=ffcc99 
ICON="%{F#$color}$1   %{F-}"
STR=$2
sysinfo="`./cputempctl.sh`\n`./gputempctl.sh`\n`lsb_release -a | awk 'FNR==3{print $2,$3}'`\n`uname -r`\n`LC_ALL=en_US.UTF-8 date +'%a %H:%M %d/%m/%Y'`"
echo -e "$sysinfo" | awk -v str="$STR" -v icon="$ICON" 'FNR==str {print icon $0}'
