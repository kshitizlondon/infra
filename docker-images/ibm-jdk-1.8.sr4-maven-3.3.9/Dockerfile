FROM ibmjava:8-sdk

RUN mkdir /logs
RUN mkdir /.m2 \
    && chmod guo+rwx /.m2
RUN apt-get update
RUN apt-get install maven=3.3.9-3 -y
RUN mkdir /build/
RUN cd build
RUN openssl s_client -connect 53.48.22.42:443 </dev/null | sed -ne '/-BEGIN CERTIFICATE-/,/-END CERTIFICATE-/p' > daimler.crt
RUN keytool -import -noprompt -trustcacerts -alias 53.48.22.42 -file daimler.crt -keystore /opt/ibm/java/jre/lib/security/cacerts -storepass changeit
ENV MAVEN_OPTS="-Xmx2048m -XX:MaxPermSize=512m"
VOLUME ["/mvn-repo/", "/build/"]

