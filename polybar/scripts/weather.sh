#!/bin/bash
[ "$#" -ne 2 ] && exit
#OPENWEATHERMAP_API_KEY
OPENWEATHERMAP_API_KEY=
LAT=$1
LON=$2
data_path='.weather[].main,.main.temp,.main.humidity,.wind.speed'
data=$(curl -sf "https://api.openweathermap.org/data/2.5/weather?lat=$LAT&lon=$LON&units=metric&lang=en&appid=$OPENWEATHERMAP_API_KEY" | jq -r $data_path)
read MAIN TEMP HUM WSPEED <<< $(echo $data)
DELIM="%{F#ffcc99}|%{F-}"
echo " $MAIN_ICON $MAIN $DELIM$TEMP󰔄$DELIM  "$WSPEED"m/s"
