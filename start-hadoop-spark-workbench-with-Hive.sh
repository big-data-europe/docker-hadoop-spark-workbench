#!/bin/bash -x

docker-compose up -f docker-compose-hive.yml -d namenode hive-metastore-postgresql
docker-compose up -f docker-compose-hive.yml -d datanode hive-metastore
docker-compose up -f docker-compose-hive.yml -d hive-server
docker-compose up -f docker-compose-hive.yml -d spark-master spark-worker spark-notebook hue

echo "Namenode: http://locahost:50070"
echo "Datanode: http://locahost:50075"
echo "Spark-master: http://locahost:8080"
echo "Spark-notebook: http://localhost:9001"
echo "Hue (HDFS Filebrowser): http://localhost:8088"

