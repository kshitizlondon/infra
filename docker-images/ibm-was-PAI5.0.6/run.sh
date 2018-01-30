/bin/echo "" > /opt/IBM/WebSphere/Profiles/base/logs/base_cluster_member_0_0/SystemOut.log
/bin/sh /opt/IBM/WebSphere/Profiles/dmgr/bin/startManager.sh
/bin/sh /opt/IBM/WebSphere/Profiles/base/bin/startNode.sh
/bin/sh /opt/IBM/WebSphere/Profiles/base/bin/startServer.sh base_cluster_member_0_0
/usr/bin/tail -F /opt/IBM/WebSphere/Profiles/base/logs/base_cluster_member_0_0/SystemOut.log