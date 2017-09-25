# Running Hadoop and Spark in Swarm cluster

Create an overlay network:
```
docker network create -d overlay --attachable core
```

To deploy hadoop run:
```
docker stack deploy -c docker-compose-hadoop-swarm.yml hadoop
```

When datanodes are deployed before namenode, they can not reach namenode over the network. In case this happened, restart the datanode service:
```
# First check the logs
docker logs -f hadoop_datanode.mdpzql2nkqyabgikmy2ks9vgg.sl8hoqhrwd10kgrvagm2aopoe
# if there is a line 
# 17/09/25 08:06:19 WARN datanode.DataNode: Problem connecting to server: namenode:8020
# Check the service name
docker service ls
# And restart the datanode service
docker service update --force hadoop_datanode
```

To deploy spark run:
```
docker stack deploy -c docker-compose-spark.yml spark
```
