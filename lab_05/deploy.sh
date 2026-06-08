#!/bin/bash -x

docker stop nginx-cont
docker rm nginx-cont

docker build -t devops/nginx-server ./nginx

docker run -d --name ngin-cont -p 54321:80 --restart unless-stopped devops/nginx-server

docker ps -a
sleep 5
curl 127.0.0.1:54321
docker logs -n nginx-cont