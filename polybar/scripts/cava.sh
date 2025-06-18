#!/bin/bash
if [ $# -lt 2 ]; then
	count=40
	id=0 
else
    count=$1
	id=$2
fi  
bar="_▂▃▄▅▆▇█"
dict="s/;//g;"

# creating "dictionary" to replace char with bar
i=0
while [ $i -lt ${#bar} ]
do
    dict="${dict}s/$i/${bar:$i:1}/g;"
    i=$((i=i+1))
done

# $id - порядковый номер процесса
# write cava config
config_file="/tmp/polybar_cava_config_$id"
echo "
[general]
bars = $count
framerate=144

[output]
method = raw
raw_target = /dev/stdout
data_format = ascii
ascii_max_range = 7

[input]
method = pulse

[color]
foreground = '#ff0000'
gradient = 1
gradient_count = 3
gradient_color_1 = '#94e2d5'
gradient_color_2 = '#a5f3e6'
gradient_color_3 = '#b704f7'
" > $config_file

# read stdout from cava


cava -p $config_file | while read -r line; do
	[[ "$line" =~ [6-8] ]] && color=ffcc99 || color=99ccff
	#echo $line | sed $dict
	echo "%{F#$color}$line%{F-}" | sed $dict
done
