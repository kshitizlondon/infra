docker run --restart=always --volume=/:/rootfs:ro --volume=/var/run:/var/run:rw --volume=/sys:/sys:ro --volume=/var/lib/docker/:/var/lib/docker:ro --publish=8200:8080 --detach=true --name=cadvisor google/cadvisor:latest
docker run --restart=always --publish=9100:9100 --detach=true --name=nodeexporter prom/node-exporter:latest

