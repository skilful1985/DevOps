#!/bin/bash -x

#Создаем сертификат
#sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout ./nginx/ssl/private/nginx-selfsigned.key -out ./nginx/ssl/certs/nginx-selfsigned.crt



docker stop nginx-cont
docker rm nginx-cont

docker build -t devops/nginx-server ./nginx

docker run -d --name nginx-cont -p 54321:80 -p 4321:443 --restart unless-stopped devops/nginx-server

docker ps -a
sleep 5
curl 127.0.0.1:4321
docker logs -n 10 nginx-cont