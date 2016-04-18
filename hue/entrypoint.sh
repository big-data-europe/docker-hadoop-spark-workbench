#!/bin/bash

HUE_HOME="/opt/hue/"
HUE_CONFIG_FILE="$HUE_HOME/desktop/conf/pseudo-distributed.ini"
APP_BLACKLIST="search,security,oozie,jobbrowser,pig,beeswax,search,zookeeper,impala,rdbms,spark,metastore,hbase,sqoop,jobsub,about"
NAMENODE_HOST="namenode"

sed -i "s#.*blacklist.*#  app_blacklist=$APP_BLACKLIST#g" $HUE_CONFIG_FILE
sed -i "s#.*webhdfs_url.*#  webhdfs_url=http://$NAMENODE_HOST:50070/webhdfs/v1#g" $HUE_CONFIG_FILE

exec $@
