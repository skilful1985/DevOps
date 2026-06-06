#!/bin/bash

#curl wttr.in/$1?format=j2 | jq '.["current_condition"][0] | .temp_C,.humidity' > /var/www/html/index.nginx-debian.html

# Считываем значение с сайта
temp=$(curl -s wttr.in/$1?format=j2 | jq -r '.["current_condition"][0] | .temp_C')
humid=$(curl -s wttr.in/$1?format=j2 | jq -r '.["current_condition"][0] | .humidity')

# Создаем файл HTML
cat <<EOF > /var/www/html/index.nginx-debian.html
<!DOCTYPE html>
<html>
<head>
    <title>My weather</title>
</head>
<body>
    <h1>My city: $1</h1>
    <ul>
        <li>Temperature,C: $temp</li>
        <li>Humidity: $humid</li>
    </ul>
</body>
</html>
EOF
