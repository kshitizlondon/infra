## Overview
This script creates folder structure for docker registry, generates self signed certificates, adds test user to htpasswd file and starts container.
### Requirements
* Make sure *apache-htpasswd* is installed on machine where registry will be located. Otherwise install it:
```sh
$ apt install apache2-utils
```
* Make sure *docker-compose* is installed on machine where registry will be located. Otherwise install it:
```sh
$ apt install docker-compose
```

### Usage
Script should be run by root user.
```sh
$ ./create-registry {domain} {port}
```
 
 - domain (required) - Please specify valid domain name of host where registry container will be started. Example:        someserver.nttdata.com. Also dns are needed for certificate generating.
 
 - port (required) - Please specify port for registry container. Make sure port is not used by other containers/applications. 

---

After container is started please follow instructions explaining how to move certificates to client hosts and how to add new users of registry in readme files:
```sh
$ vim /opt/docker-registry/certs/readme
```
```sh
$ vim /opt/docker-registry/auth/readme
```	