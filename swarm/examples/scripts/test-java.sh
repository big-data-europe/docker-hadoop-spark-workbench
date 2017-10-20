#!/bin/bash
echo "### Java HDFS test ###"

cd /hdfs/example-java-read-and-write-from-hdfs
ls -alh
java -jar target/example-java-read-and-write-from-hdfs-1.0-SNAPSHOT-jar-with-dependencies.jar hdfs://namenode:8020

