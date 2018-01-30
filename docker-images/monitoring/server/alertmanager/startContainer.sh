cp ./config.yml /var/monitoring/alertmanager/.
docker run --restart=always --volume=/var/monitoring/alertmanager:/etc/alertmanager/ --publish=9093:9093 --name=alertmanager prom/alertmanager '-config.file=/etc/alertmanager/config.yml' '-storage.path=/alertmanager'
#  alertmanager:
#    image: prom/alertmanager
#    container_name: alertmanager
#    volumes: 
#      - /var/monitoring/alertmanager:/etc/alertmanager/
#    command:
#      - '-config.file=/etc/alertmanager/config.yml'
#      - '-storage.path=/alertmanager'
#    restart: unless-stopped
#    expose:
#      - 9093
#    ports:
#      - 9093:9093