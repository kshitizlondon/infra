FROM ubuntu:16.04

RUN apt-get update
 
RUN apt-get install maven=3.3.9-3 -y

RUN apt-get install -y --no-install-recommends wget ca-certificates \
    && rm -rf /var/lib/apt/lists/*


RUN wget -q -U UA_IBM_JAVA_Docker -O /tmp/ibm-java.bin https://public.dhe.ibm.com/ibmdl/export/pub/systems/cloud/runtimes/java/7.0.9.60/linux/x64/ibm-java-sdk-7.0-9.60-x86_64-archive.bin \
    && echo "INSTALLER_UI=silent" > /tmp/response.properties \
    && echo "USER_INSTALL_DIR=/opt/ibm/java" >> /tmp/response.properties \
    && echo "LICENSE_ACCEPTED=TRUE" >> /tmp/response.properties \
    && mkdir -p /opt/ibm \
    && chmod +x /tmp/ibm-java.bin \
    && /tmp/ibm-java.bin -i silent -f /tmp/response.properties \
    && rm -f /tmp/response.properties \
    && rm -f /tmp/ibm-java.bin

RUN mkdir /.m2 \
    && chmod guo+rwx /.m2

RUN mkdir /build/ \
    && cd build

RUN openssl s_client -connect 53.48.22.42:443 </dev/null | sed -ne '/-BEGIN CERTIFICATE-/,/-END CERTIFICATE-/p' > daimler.crt

RUN keytool -import -noprompt -trustcacerts -alias 53.48.22.42 -file daimler.crt -keystore /opt/ibm/java/jre/lib/security/cacerts -storepass changeit

ENV JAVA_HOME=/opt/ibm/java/jre \
    PATH=/opt/ibm/java/bin:$PATH

VOLUME ["/mvn-repo/", "/build/"]

