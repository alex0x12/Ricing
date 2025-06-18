#!/bin/bash
power=$(bluetoothctl info | grep "Battery Percentage" | awk '{print substr($4,2,length($4)-2)}')
[ "$power" == "" ] && echo "%{T2} %{T-}" && exit;
[ $power -le 100 ] && icon="󰥈 "  
[ $power -le 90 ] && icon="󰥆 "  
[ $power -le 80 ] && icon="󰥅 "  
[ $power -le 70 ] && icon="󰥄 "  
[ $power -le 60 ] && icon="󰥃 " 
[ $power -le 50 ] && icon="󰥂 "  
[ $power -le 40 ] && icon="󰥁 "  
[ $power -le 30 ] && icon="󰥀 "   
[ $power -le 20 ] && icon="󰤿 "  
[ $power -le 10 ] && icon="󰤾 "  
[ $power -le  5 ] && icon="󰥇 "
echo %{F\#ffcc99}%{T2}$icon%{T-}%{F-}$power%
