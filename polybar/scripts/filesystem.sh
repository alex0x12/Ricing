#!/bin/bash
[ $# -lt 1 ] && exit;
arg=$(($1-1))
count=3
[ $(($arg%$count)) -eq 0 ] && mountpoint=/home && alias="~";
[ $(($arg%$count)) -eq 1 ] && mountpoint=/ && alias="Root";
[ $(($arg%$count)) -eq 2 ] && mountpoint=/mnt && alias="MNT";
if [ -n "$mountpoint" ] 
then
	STR=`df -h | grep "$mountpoint$" | awk -v var="$alias" '{print var":"$4"/"$2}'`
    echo "%{T1}%{F#ffcc99} %{F-}  $STR%{T-}"
fi
