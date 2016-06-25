#!/bin/bash

# クラスタ名の設定 -e CLUSTER_NAME=<クラスタ名>
if [ -z "${CLUSTER_NAME+x}" ] ; then
    export CLUSTER_NAME=IMBox Cluster
fi

sed -i -e "s/CLUSTER_NAME/$CLUSTER_NAME/g" /usr/local/cassandra/conf/cassandra.yaml
sed -i -e "s/THIS_HOST_NAME/$HOSTNAME/g" /usr/local/cassandra/conf/cassandra.yaml

#start cassandra
/usr/local/cassandra/bin/cassandra -p /var/run/cassandra.pid
#/usr/local/cassandra/bin/cassandra -f

until netstat -an | grep 9160;
do
    sleep 1

done

echo "Check keyspaces..."
/usr/local/cassandra/bin/cassandra-cli -h $HOSTNAME -u aoyagi -pw aoyagi_pwd -f /usr/local/cassandra/conf/check_keyspace.txt
if [ $? -eq 4 ]; then
   /usr/local/cassandra/bin/cassandra-cli -h $HOSTNAME -u aoyagi -pw aoyagi_pwd -f /usr/local/cassandra/conf/imbox_keyspace.txt
   echo "Create imbox_keyspace"
fi

echo "DONE!"

tail -f /dev/null

