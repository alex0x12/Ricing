#!/bin/bash
temp=$(nvidia-settings -q gpucoretemp -t)
speed=$(( temp*100/70 ))
mem_used=$(nvidia-smi --query-gpu=memory.used --format=csv,noheader,nounits)
mem_total=$(nvidia-smi --query-gpu=memory.total --format=csv,noheader)
nvidia-settings -a "[gpu:0]/GPUFanControlState=1" -a "[fan:0]/GPUTargetFanSpeed="$speed"" &>/dev/null  
echo $temp"°C " $speed"% "$mem_used"/"$mem_total

