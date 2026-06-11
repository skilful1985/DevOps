#!/bin/bash -x

#Создаем сертификат
sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout ./nginx/ssl/nginx-selfsigned.key \
    -out ./nginx/ssl/nginx-selfsigned.crt \
    -subj "/C=RU/ST=Perm/L=Perm/O=MyCompany/OU=IT/CN=localhost"

docker exec nginx-cont nginx -s reload