docker build -t ibm-was-pai5.0.6:1.0 .
docker tag ibm-was-pai5.0.6:1.0 db.ddn.nttdata-emea.com:5443/ibm-was-pai5.0.6:latest
docker push db.ddn.nttdata-emea.com:5443/ibm-was-pai5.0.6:latest
