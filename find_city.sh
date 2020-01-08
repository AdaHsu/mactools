#!/bin/zsh

CITY_INFO_FILE=/tmp/city

curl -s https://freegeoip.app/csv/ | cut -d, -f 5 | cut -d' ' -f 1 > ${CITY_INFO_FILE}