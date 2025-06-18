#!/bin/bash
muted=`pactl get-source-mute @DEFAULT_SOURCE@ | awk '{print $2}'`
[ "$muted" == "yes" ] && echo "%{F#99ccff}%{T2}󰍭%{T-}%{F-}"|| echo "%{F#ffcc99}%{T2}󰍬%{T-}%{F-}"
