docker build --pull -t ibm-jdk-1.7.sr9-maven-3.3.9:1.0.0 .
#docker tag ibm-jdk-1.7.sr9-maven-3.3.9:1.0.0 ibm-jdk-1.7.sr9-maven-3.3.9
docker tag ibm-jdk-1.7.sr9-maven-3.3.9:1.0.0 db.ddn.nttdata-emea.com:5443/ibm-jdk-1.7.sr9-maven-3.3.9:latest
docker push db.ddn.nttdata-emea.com:5443/ibm-jdk-1.7.sr9-maven-3.3.9:latest

