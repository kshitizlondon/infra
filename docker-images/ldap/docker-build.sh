rm -f apacheds-2.0.0-M23.zip
wget http://mirror.23media.de/apache//directory/apacheds/dist/2.0.0-M23/apacheds-2.0.0-M23.zip
unzip apacheds-2.0.0-M23.zip -d $PWD/ >>unzip.log
docker build -t ldap:1.0 .
rm -R -f apacheds-2.0.0-M23

docker tag ldap:0.0.1 ldap
