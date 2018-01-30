docker build --pull -t ubuntu-base:16.04 .
docker tag ubuntu-base:16.04 db.ddn.nttdata-emea.com:5443/ubuntu-base:latest
docker push db.ddn.nttdata-emea.com:5443/ubuntu-base:latest
#docker tag ubuntu-base:16.04 ubuntu-base
