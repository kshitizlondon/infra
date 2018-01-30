#!/bin/sh
docker build -t jenkins-docker .
docker tag jenkins-docker db.ddn.nttdata-emea.com:5443/jenkins-docker:latest
docker push db.ddn.nttdata-emea.com:5443/jenkins-docker:latest

