#!/bin/bash
cmd="xset -q|grep LED| awk '{ print \$10 }'"
icon=
color=99ccff
[[ "$(eval $cmd)" =~ ^0000000[0-1]$ ]] && layout="en" || layout="ru"
if [[ "$(eval $cmd)" =~ ^[0-1]{7}1$ ]]; then
 caps_status= 
 color_caps=ffcc99
else
 caps_status=
 color_caps=99ccff
fi

echo %{F\#$color}%{T2}"$icon %{T1}$layout "%{F\#$color_caps}%{T1}"$caps_status "%{T-}%{F-}
