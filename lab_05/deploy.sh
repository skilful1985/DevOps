#!/bin/bash -x

#Создаем сертификат
sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout ./nginx/ssl/nginx-selfsigned.key \
    -out ./nginx/ssl/nginx-selfsigned.crt \
    -subj "/C=RU/ST=Perm/L=Perm/O=MyCompany/OU=IT/CN=localhost"

docker stop nginx-cont
docker rm nginx-cont

docker build -t devops/nginx-server ./nginx

docker run -d \
  --name nginx-cont \
  -p 54321:80 \
  -p 4321:443 \
  --restart unless-stopped \
  devops/nginx-server

docker ps -a
sleep 5
curl localhost:4321
docker logs -n 10 nginx-cont