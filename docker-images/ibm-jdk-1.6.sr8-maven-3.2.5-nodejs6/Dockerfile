#FROM ibm-jdk-1.6.sr8-maven-3.2.5:1.0.0
FROM db.ddn.nttdata-emea.com:5443/ibm-jdk-1.6.sr8-maven-3.2.5:latest

RUN apt-get update >> /logs/ubuntuUpdate.log 2>&1 && \
	apt-get -y upgrade >> /logs/ubuntuUpgrade.log 2>&1 && \
	apt-get install -y curl >> /logs/installCurl.log 2>&1 && \
	curl -sL https://deb.nodesource.com/setup_6.x | bash - >> /logs/addNodeRepo.log 2>&1 && \
	apt-get install -y nodejs >> /logs/installNodeAndNpm.log 2>&1
	
VOLUME ["/mvn-repo/", "/build/"]
CMD mvn clean install -f/build/pom.xml -Dmaven.repo.local=/mvn-repo/
