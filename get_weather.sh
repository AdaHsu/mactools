#!/bin/zsh

WEATHER_INFO_FILE=/tmp/weather

CITY_INFO_FILE=/tmp/city
CITY_NAME=$(head -n 1 ${CITY_INFO_FILE})

WEATHER_RAW=$(curl -s "https://wttr.in/${CITY_NAME}?format=%C,%t")
WEATHER_STATUS=$(echo ${WEATHER_RAW} | cut -d, -f 1)
WEATHER_TEMPERATURE=$(echo ${WEATHER_RAW} | cut -d, -f 2 | tr -d "\n" | tr -d "\r")
# WEATHER_STATUS_LOCAL=$(trans "${WEATHER_STATUS}" -from en-US -to zh-TW -show-original-phonetics N -show-original N | head -n 1 | tr -d "\n" | tr -d "\r")
# echo "${WEATHER_CITY}:${WEATHER_STATUS}" > ${WEATHER_INFO_FILE}
echo "${WEATHER_STATUS}, ${WEATHER_TEMPERATURE}" > ${WEATHER_INFO_FILE}