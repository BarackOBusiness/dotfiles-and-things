#!/bin/sh
#CONTENT=$(curl -s https://freegeoip.app/json/)
#longitude=$(echo $CONTENT | jq .longitude)
#latitude=$(echo $CONTENT | jq .latitude)
longitude=-73
latitude=40.9

wlsunset -l $latitude -L $longitude
