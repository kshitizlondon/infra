## intended use:
#	docker run --name=wascontainer --add-host ntt-rvs-dev2.local:127.0.0.1 -d -v HOSTLOGPATH:/opt/IBM/WebSphere/Profiles/base/logs/base_cluster_member_0_0 -p 9081:9081 -p 9043:9043 -p 7777:7777 IMAGENAME
#
## meaning of the parameters:
# --name=wascontainer: set name for easier start stop 
# --add-host ntt-rvs-dev2.local:127.0.0.1: WAS needs this entry in /etc/hosts 
# -d: detached mode to not block shell
# -v /vagrant/logs:/opt/IBM/WebSphere/Profiles/base/logs/base_cluster_member_0_0: to see WAS logs from outside vagrant
# -p 9081:9081 -p 9043:9043 -p 7777:7777: forward ports from container to vagrant VM
#
# attach with:
# docker exec -it wascontainer /bin/bash
#

# target system is SLES11 or SLES12. opensuse leap (42.x) is based on SLES.
FROM opensuse:42.3

#INSTALL PACKAGES
RUN mkdir /logs && \
	zypper --no-gpg-checks refresh >> /logs/zypperRefresh.log 2>&1 && \
	zypper -non-interactive install wget >> /logs/installWget.log 2>&1 && \
	zypper -non-interactive install dos2unix >> /logs/installDos2Unix.log 2>&1 && \
	zypper -non-interactive install net-tools >> /logs/installNettools.log 2>&1

# --- SETUP PAI 5.0.6 WAS -----------
# --- if you supply pai506was.tar.gz on the local filesystem
#ADD pai506was.tar.gz /tmp/
#RUN mv /tmp/opt/* /opt/ 
# --- if pai506was.tar.gz needs to be downloaded
RUN wget http://10.224.22.5/zippedInstalled/pai506was.tar.gz -q
RUN tar -xzf pai506was.tar.gz -C /tmp/ && \
    mv /tmp/opt/* /opt/ && \
    rm pai506was.tar.gz
# ----------------------------------

VOLUME ["/opt/IBM/WebSphere/Profiles/base/logs/base_cluster_member_0_0"] 

# ports for: debug, admin console, application
EXPOSE 7777 9043 9081

COPY run.sh /
RUN dos2unix /run.sh
CMD ["/bin/sh", "/run.sh"]
