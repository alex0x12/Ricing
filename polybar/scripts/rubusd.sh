#!/bin/bash
ind="YMlKec fxKbKc"
file="/tmp/currency_wget.txt"
echo '' > $file
PAGE=$(wget -q -O $file https://www.google.com/finance/quote/USD-RUB) 
curr=$(cat $file | grep -oP "$ind\">.{0,6}" | cut -c 16-)
echo " $curr"
