#!/bin/bash

#curl wttr.in/$1?format=j2 | jq '.["current_condition"][0] | .temp_C,.humidity' > /var/www/html/index.nginx-debian.html

temp=$(curl -s wttr.in/$1?format=j2 | jq -r '.["current_condition"][0] | .temp_C')
humid=$(curl -s wttr.in/$1?format=j2 | jq -r '.["current_condition"][0] | .humidity')

echo $1
echo "Temperature,C =" $temp
echo "Humidity =" $humid
