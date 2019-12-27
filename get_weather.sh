#!/bin/zsh

WEATHER_INFO_FILE=/tmp/weather

CITY_INFO_FILE=/tmp/city
CITY_NAME=$(head -n 1 ${CITY_INFO_FILE})

WEATHER_RAW=$(curl -s "https://wttr.in/${CITY_NAME}?format=3")
WEATHER_CITY=$(echo ${WEATHER_RAW} | cut -d: -f 1 | cut -d, -f 1 | cut -d\  -f 1)
WEATHER_STATUS=$(echo ${WEATHER_RAW} | cut -d: -f 2)
# echo "${WEATHER_CITY}:${WEATHER_STATUS}" > ${WEATHER_INFO_FILE}
echo "${WEATHER_STATUS}" > ${WEATHER_INFO_FILE}