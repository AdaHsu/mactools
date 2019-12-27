#!/bin/zsh

CITY_INFO_FILE=/tmp/city

curl -s https://freegeoip.app/csv/ | cut -d, -f 6 > ${CITY_INFO_FILE}