FROM ubuntu:16.04

# update available packages
RUN apt-get update -y

# install wget
RUN  apt-get update \
  && apt-get -qq -y install wget

# install maven
RUN wget -q -O /tmp/apache-maven-3.2.5-bin.tar.gz http://mirrors.sonic.net/apache/maven/maven-3/3.2.5/binaries/apache-maven-3.2.5-bin.tar.gz \
    && tar -xvzf /tmp/apache-maven-3.2.5-bin.tar.gz

# install certificate
RUN apt-get install -y --no-install-recommends wget ca-certificates \
    && rm -rf /var/lib/apt/lists/*

# install 32bit libs for java 32 bit on 64bit system
RUN dpkg --add-architecture i386 \
    &&  apt-get -qq update \
    && apt-get -qq -y install libc6:i386 libncurses5:i386 libstdc++6:i386

# install java
RUN wget -q -U UA_IBM_JAVA_Docker -O /tmp/ibm-java.bin http://public.dhe.ibm.com/ibmdl/export/pub/systems/cloud/runtimes/java/6.0.16.50/linux/i386/ibm-java-sdk-6.0-16.50-linux-i386.bin \
    && echo "INSTALLER_UI=silent" > /tmp/response.properties \
    && echo "USER_INSTALL_DIR=/opt/ibm/java" >> /tmp/response.properties \
    && echo "LICENSE_ACCEPTED=TRUE" >> /tmp/response.properties \
    && chmod +x /tmp/ibm-java.bin \
    && /tmp/ibm-java.bin -i silent -f /tmp/response.properties \
    && rm -f /tmp/response.properties \
    && rm -f /tmp/ibm-java.bin

# create folder for source code	
RUN mkdir /build/ \
    && cd build

# create folder for maven
RUN mkdir /.m2 \
    && chmod guo+rwx /.m2

# Set environment variables
ENV JAVA_HOME=/tmp/ibm-java-i386-60 \
    PATH=/tmp/ibm-java-i386-60/bin:/apache-maven-3.2.5/bin:$PATH

# Save certivicate
RUN openssl s_client -connect 53.48.22.42:443 </dev/null | sed -ne '/-BEGIN CERTIFICATE-/,/-END CERTIFICATE-/p' > daimler.crt

# Add certificate to java
RUN keytool -import -noprompt -trustcacerts -alias 53.48.22.42 -file daimler.crt -keystore /tmp/ibm-java-i386-60/jre/lib/security/cacerts -storepass changeit

# mount volumes
VOLUME ["/mvn-repo/", "/build/"]

