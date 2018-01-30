FROM ubuntu:16.04

RUN mkdir /logs
RUN apt-get update --yes >> /logs/unbuntuUpdate.log
RUN apt-get upgrade --yes >>/logs/ubuntuUpgerade.log
RUN apt-get install openjdk-8-jdk --yes >> /logs/install_openjdk-8-jdk.log

RUN mkdir ldap
COPY apacheds-2.0.0-M23/ /ldap/.
RUN chmod a+x /ldap/bin/apacheds.sh
RUN ls -al -R /ldap/

EXPOSE 10389 10636
VOLUME ["/ldap/instances/"]

COPY startApacheDs.sh /.
RUN chmod a+x /startApacheDs.sh
CMD /startApacheDs.sh