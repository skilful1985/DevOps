#!/bin/bash

echo $1

curl wttr.in/$1?format=j2 | jq '.["current_condition"][0] | .temp_C,.humidity' > /var/www/html/index.nginx-debian.html