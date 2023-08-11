#!/bin/bash

ip=$1
if [ -z $ip ]; then
	echo "Too few arguments"
	exit
fi

result=$(curl -s http://ip-api.com/json/$ip)

if [ -n $2 ] && [ ! $2 = "" ]; then
	if [ $2 = "-r" ] || [ $2 = "--raw" ]; then
		echo $result | jq
		exit
	else
		echo "Invalid argument"
		exit
	fi
fi

status=$(echo $result | jq .status | awk -F "\"" '{print $2}')
country=$(echo $result | jq .country | awk -F "\"" '{print $2}')
asn=$(echo $result | jq .as | awk -F "\"" '{print $2}')

echo "/==== Geographic info for IP ${1} ====\\"
echo "Status:" $status
echo "Country:" $country
echo "ASN:" $asn

