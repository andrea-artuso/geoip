#!/bin/bash

regex_ipv4="^((25[0-5]|(2[0-4]|1\d|[1-9]|)\d)\.?\b){4}$"

help_menu () {
	echo "Usage: geoip [OPTIONS] <ip_address>"
	echo "Options:"
	echo "  -R,  --raw\tShows the output in JSON format"
	echo "  --help\tShows this menu"
}

ip_info_raw () {
	result=$(curl -s http://ip-api.com/json/$1)
	echo $result | jq
}

ip_info () {
	result=$(curl -s http://ip-api.com/json/$1)

	status=$(echo $result | jq .status | awk -F "\"" '{print $2}')
	country=$(echo $result | jq .country | awk -F "\"" '{print $2}')
	asn=$(echo $result | jq .as | awk -F "\"" '{print $2}')

	echo "/==== Geographic info for IP ${1} ====\\"
	echo "Status:" $status
	echo "Country:" $country
	echo "ASN:" $asn
}

if [ -z "$1" ]; then
	echo "Missing argument"
	help_menu && exit 2
fi
if [ "$1" == "--help" ]; then
	help_menu
	exit
fi

if { [ "$1" == "-R" ] || [ "$1" == "--raw" ]; } && [[ $2 =~ [^$regex_ipv4] ]]; then
	ip_info_raw $2
	exit
elif [[ $1 =~ [^$regex_ipv4] ]]; then
	ip_info $1
	exit
else
	echo "Wrong arguments. See geoip --help"
fi
