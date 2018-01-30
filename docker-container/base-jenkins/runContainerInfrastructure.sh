#!/bin/sh
docker run -d -v /var/run/docker.sock:/var/run/docker.sock -v /usr/bin/docker:/usr/bin/docker -p 8090:8080 -v /var/jenkins/test:/var/jenkins_home --name jenkins-infrastructur jenkins-docker
