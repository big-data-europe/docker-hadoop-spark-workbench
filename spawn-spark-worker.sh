#!/bin/bash

CPU_SET=$1 #0-3
MEMORY_LIMIT=$2 #4g

docker run -d --net hadoop --cpuset-cpus="$CPU_SET" --memory="$MEMORY_LIMIT" --env-file=./hadoop.env -e "CORE_CONF_fs_defaultFS=hdfs://namenode:8020" -e "YARN_CONF_yarn_resourcemanager_hostname=resourcemanager" -e "SPARK_CONF_spark_eventLog_enabled=true" -e "SPARK_CONF_spark_eventLog_dir=hdfs://namenode:8020/spark-logs" -e "SPARK_CONF_spark_history_fs_logDirectory=hdfs://namenode:8020/spark-logs" -e "SPARK_MASTER_URL=spark://spark-master-workbench:7077" bde2020/hadoop-spark-worker 
