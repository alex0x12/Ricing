#!/bin/bash
CONFIG_PATH="../config.ini"
INI_PATH="./autoconf.ini"
while IFS='=' read -r key value;
do  
	place=""
	[ -z "$value" ] && exit;
	if [ "$key" == "WALLET" ]; then
		var="usdtbalance.sh"
		place=$(grep "$var" $CONFIG_PATH | awk -F ' ' '{print $2}')
	fi 
	if [ "$key" == "BLOCKCHAIN" ]; then
		var="usdtbalance.sh"
		place=$(grep "$var" $CONFIG_PATH | awk -F ' ' '{print $3}')
	fi
    if [ "$key" == "LAT" ]; then
		var="weather.sh"
		place=$(grep "$var" $CONFIG_PATH | awk -F ' ' '{print $2}')
	fi
	if [ "$key" == "LON" ]; then
		var="weather.sh"
		place=$(grep "$var" $CONFIG_PATH | awk -F ' ' '{print $3}')
	fi
	[ -n "$place" ] && sed -i -e "s/$place/$value/g" ../config.ini
done < <(sed '1d' $INI_PATH)
echo "config.ini successfully updated.";
