#!/bin/sh

# https://hub.docker.com/r/dperson/samba/
docker run -it --name samba -p 139:139 -p 445:445 -v /var/share/data:/mount -d --restart=always dperson/samba
docker exec -it samba samba.sh -t Europe/Berlin ls -AlF /etc/localtime
docker restart samba
docker exec -it samba samba.sh -u "admin;sambaShareAdmin"
docker exec -it samba samba.sh -s "public;/mount/public;yes;yes;yes;all;none;admin"
docker exec -it samba samba.sh -s "test;/mount/test;yes;no;no;admin;admin;admin"
docker restart samba
