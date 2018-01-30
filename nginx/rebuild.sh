#!/bin/bash
docker stop nginx-reverseproxy
docker rm nginx-reverseproxy
docker rmi nginx-reverseproxy
docker build -t nginx-reverseproxy .
docker run -d --name nginx-reverseproxy -p 80:80 -p 443:443 -p 8081:8081 -p 8090:8090  -p 9000:9000 -p 10080:10080 -p 9081:9081 -p 8080:8080 nginx-reverseproxy
