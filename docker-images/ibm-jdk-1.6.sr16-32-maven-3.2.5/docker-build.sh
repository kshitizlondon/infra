docker build --pull -t ibm-jdk-1.6.sr16-32-maven-3.2.5:1.0.0 .
docker tag ibm-jdk-1.6.sr16-32-maven-3.2.5:1.0.0 db.ddn.nttdata-emea.com:5443/ibm-jdk-1.6.sr16-32-maven-3.2.5:latest
docker push db.ddn.nttdata-emea.com:5443/ibm-jdk-1.6.sr16-32-maven-3.2.5:latest
