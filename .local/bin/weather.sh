#!/bin/bash
# Based on http://openweathermap.org/current

API_KEY="7e237354473e6642c7e7655369574a58"

# Check on http://openweathermap.org/find
CITY_ID=""4887158

ICON_CLEAR=""
ICON_CLOUDY=""
ICON_RAINY=""
ICON_STORM=""
ICON_SNOW=""
ICON_FOG=""

SYMBOL_CELSIUS="°F"

WEATHER_URL="http://api.openweathermap.org/data/2.5/weather?id=${CITY_ID}&appid=${API_KEY}&units=imperial"

WEATHER_INFO=$(wget -qO- "${WEATHER_URL}")
WEATHER_MAIN=$(echo "${WEATHER_INFO}" | grep -o -e '\"main\":\"[a-Z]*\"' | awk -F ':' '{print $2}' | tr -d '"')
WEATHER_TEMP=$(echo "${WEATHER_INFO}" | grep -o -e '\"temp\":\-\?[0-9]*' | awk -F ':' '{print $2}' | tr -d '"')

#if [[ "${WEATHER_MAIN}" = *Snow* ]]; then
#  echo "${ICON_SNOW} ${WEATHER_MAIN}, ${WEATHER_TEMP}${SYMBOL_CELSIUS}"
#elif [[ "${WEATHER_MAIN}" = *Rain* ]] || [[ "${WEATHER_MAIN}" = *Drizzle* ]]; then
#  echo "${ICON_RAINY} ${WEATHER_MAIN}, ${WEATHER_TEMP}${SYMBOL_CELSIUS}"
#elif [[ "${WEATHER_MAIN}" = *Cloud* ]]; then
#  echo "${ICON_CLOUDY} ${WEATHER_MAIN}, ${WEATHER_TEMP}${SYMBOL_CELSIUS}"
#elif [[ "${WEATHER_MAIN}" = *Clear* ]]; then
#  echo "${ICON_CLEAR} ${WEATHER_MAIN}, ${WEATHER_TEMP}${SYMBOL_CELSIUS}"
#elif [[ "${WEATHER_MAIN}" = *Storm* ]] || [[ "${WEATHER_MAIN}" = *Thunderstorm* ]]; then
#  echo "${ICON_STORM} ${WEATHER_MAIN}, ${WEATHER_TEMP}${SYMBOL_CELSIUS}"
#elif [[ "${WEATHER_MAIN}" = *Fog* ]] || [[ "${WEATHER_MAIN}" = *Mist* ]] || [[ "${WEATHER_MAIN}" = *Smoke* ]]; then
#  echo "${ICON_FOG} ${WEATHER_MAIN}, ${WEATHER_TEMP}${SYMBOL_CELSIUS}"
#else
#  echo "${WEATHER_MAIN}, ${WEATHER_TEMP}${SYMBOL_CELSIUS}"
#fi

echo "${WEATHER_MAIN}, ${WEATHER_TEMP}${SYMBOL_CELSIUS}"
