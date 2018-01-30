#!/bin/bash

DOMAIN="$1"
REGISTRY_HOME=/opt/docker-registry
REGISTRY_CERTS=$REGISTRY_HOME/certs
REGISTRY_AUTH=$REGISTRY_HOME/auth
REGISTRY_STORAGE=/mnt/registry
REGISTRY_PORT="$2"
DOCKER_COMPOSE="docker-compose.yml"

#Certificate details; replace items in angle brackets with your own info
SUBJ="
C=DE
ST=Germany
O=NTTDATA
localityName=Stuttgart
commonName=$DOMAIN
organizationalUnitName=Digital Enterprise
emailAddress=sergei.tikhanovich@nttdata.com
"

#Function creates self-signed 10 years valid certificates
createcerts() {
    cd $REGISTRY_CERTS
    if [ "$(ls -A $REGISTRY_CERTS)" ]; then
        rm *
    fi
    openssl genrsa -out rootCA.key 2048
    openssl req -x509 -new -nodes  -subj "$(echo -n "$SUBJ" | tr "\n" "/")" -key rootCA.key -days 3650 -out rootCA.pem 
    openssl genrsa -out registry.key 2048
    openssl req -new -key registry.key -subj "$(echo -n "$SUBJ" | tr "\n" "/")" -out registry.csr
    openssl x509 -req -in registry.csr -CA rootCA.pem -CAkey rootCA.key -CAcreateserial -out registry.crt -days 3650
    cp rootCA.pem ca.crt
    touch readme
    cat > readme << EOL
Please make sure you have copied ca.crt on the client machine
Destionation path on client is /etc/docker/certs.d/$DOMAIN:$REGISTRY_PORT
If folder certs.d or $DOMAIN:$REGISTRY_PORT does not exist you should create its.
EOL
}

#Function creates htpasswd and adds test user
createauth() {
    cd $REGISTRY_AUTH
    if [ "$(ls -A $REGISTRY_AUTH)" ]; then
        rm *
    fi
    touch htpasswd
    echo "Creating test user nttdata...."
    htpasswd -bB $REGISTRY_AUTH/htpasswd nttdata nttdata
    echo "Test user login:    nttdata"
    echo "Test user password: nttdata"
    cat > readme << EOL
To add new user of docker registry use command:
htpasswd -bB $REGISTRY_AUTH/htpasswd USERNAME PASSWORD
EOL
}

#Script accepts two arguments, the dns for the cert and port number for container
if [ -z "$DOMAIN" ] || [ -z "$REGISTRY_PORT" ]; then
    echo "Usage: $(basename $0) <domain> <port>"
    exit 11
fi

#Checking if script started by root
if [[ $EUID -ne 0 ]]; then
    echo "This script must be run as root" 
    exit 1
fi

echo "Creating registry...."

#creating Docker registry folders
if [ ! -d "$REGISTRY_HOME" ]; then
    mkdir $REGISTRY_HOME
else
    echo "Folder $REGISTRY_HOME already exists"
fi

if [ ! -d "$REGISTRY_CERTS" ]; then
    mkdir $REGISTRY_CERTS
else
    echo "Folder $REGISTRY_CERTS already exists"
fi

if [ ! -d "$REGISTRY_AUTH" ]; then
    mkdir $REGISTRY_AUTH
else
    echo "Folder $REGISTRY_AUTH already exists"
fi

#creating docker-compose.yml
if [ -e $REGISTRY_HOME/$DOCKER_COMPOSE ]; then
    echo "File $DOCKER_COMPOSE already exists and will be repalced by new one"
    rm $REGISTRY_HOME/$DOCKER_COMPOSE
fi
    cd $REGISTRY_HOME
    touch $DOCKER_COMPOSE
    cat > $DOCKER_COMPOSE << EOL 
registry:
    restart: always
    image: registry:2
    ports:
        - $REGISTRY_PORT:5000
    environment:
        REGISTRY_HTTP_TLS_CERTIFICATE: /certs/registry.crt
        REGISTRY_HTTP_TLS_KEY: /certs/registry.key
        REGISTRY_AUTH: htpasswd
        REGISTRY_AUTH_HTPASSWD_PATH: /auth/htpasswd
        REGISTRY_AUTH_HTPASSWD_REALM: Registry Realm
    volumes:
        - $REGISTRY_STORAGE:/var/lib/registry
        - $REGISTRY_CERTS:/certs
        - $REGISTRY_AUTH:/auth
EOL

#creating self-signed certificates
createcerts

#creating test user
createauth

#starting registry container
cd $REGISTRY_HOME
docker-compose up -d
