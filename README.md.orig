# Hadoop Docker

This repository contains *Dockerfile*s for setting up a basic Hadoop cluster.
The available components are:

1. *HDFS*:

   * *namenode*
   * *dtanode*
   
1. *YARN*:
   
   * *resourcemanager*
   * *nodemanager*

1. *Spark submitter*

All images inherit from a base *hadoop* image which provides an hadoop
installation in `/opt/` and provides a way to configure *hadoop* via
environment variables. 

## Hadoop configuration

The *hadoop* configuration is controlled via the following environment
variable groups:

1. `CORE_CONF`: affects `/etc/hadoop/core-site.xml`
1. `HDFS_CONF`: affects `/etc/hadoop/hdfs-site.xml`
1. `YARN_CONF`: affects `/etc/hadoop/yarn-site.xml`
1. `HTTPFS_CONF`: affects `/etc/hadoop/httpfs-site.xml`
1. `KMS_CONF`: affects `/etc/hadoop/KMS-site.xml` 

*Hadoop* properties by setting an environment variable with the
appropriated prefix in the form `<PREFIX>_<PROPERTY>`.

Due to restriction imposed by `docker` and `docker-compose` on
environment variable names the following substitution are applied to
property names:

* `_` => `.`
* `__` => `_`
* `___` => `-`

Following are some illustratory examples:

* `CORE_CONF_fs_defaultFS`: sets the *fs.defaultFS* property in
`core-site.xml`
* `YARN_CONF_yarn_log___aggregation___enable`: sets the
  *yarn.log-aggregation-enable* property in `yarn-site.xml`



## Hadoop configuration presets

Furthermore the following special environment variables control
configurations presets:

* `MULTIHOMED_NETWORK`: configure the *hadoop* cluster in such a way
  to be reachable from multiple networks, specifically the following
  properties are set:

    In `/etc/hadoop/hdfs-site.xml`:

    * dfs.namenode.rpc-bind-host = 0.0.0.0
    * dfs.namenode.servicerpc-bind-host = 0.0.0.0
    * dfs.namenode.http-bind-host = 0.0.0.0
    * dfs.namenode.https-bind-host = 0.0.0.0
    * dfs.client.use.datanode.hostname = true
    * dfs.datanode.use.datanode.hostname = true

    In `/etc/hadoop/yarn-site.xml`:

    * yarn.resourcemanager.bind-host = 0.0.0.0
    * yarn.nodemanager.bind-host = 0.0.0.0
    * yarn.nodemanager.bind-host = 0.0.0.0

    In `/etc/hadoop/mapred-site.xml`:

    * yarn.nodemanager.bind-host = 0.0.0.0

* `GANGLIA_HOST`: instruct *hadoop* to send metrics to the specified
  *ganglia gmond* daemon (requires a unicast ganglia configuration) 

## Networking

In order for things to run smoothly it's reccomended to exploit the
new networking infrastructure of *docker* 1.9. Create a dedicated
*network* for the cluster to run on.

Furthermore is useful to fix the container *name* and the container
*hostname* to the same value. This way every container will able to
resolve itself with the same name as other container.

Lastly is useful to set the *domainname* equal to the name of the
*network* and use *FQDN* to reference the various services.

With the specified setup is possible you'll be able to access the
web-interfaces of the various components without the annoying problem
of unresolved links (provided that you setup a dns solution to resolve
container names and configure static routing if using
*docker-machine*).

## Components

### namenode

The *hadoop-namenode* image starts an Hadoop NameNode. (single instance)

Additional environment variables:

* `CLUSTER_NAME`: name of the *HDFS* cluster (used during the initial
formatting)

Volumes:

* `/hadoop/dfs/name`: *HDFS* filesystem name directory

Mandatory configuration:

* `CLUSTER_NAME`: cluster name

*Docker-compose* template:

    namenode:
      image: uhopper/hadoop-namenode
      hostname: namenode
      container_name: namenode
      domainname: hadoop
      net: hadoop
      volumes:
        - <NAMENODE-VOLUME>:/hadoop/dfs/name
      environment:
        - GANGLIA_HOST=<GMOND-RECEIVER-HOST>
        - CLUSTER_NAME=<CLUSTER-NAME>

Once running you can connect to `http://<CONTAINER_IP>:50070` to see
the webui.

### datanode

The *hadoop-datanode* image starts an Hadoop DataNode. (multiple instances)

Volumes:

* `/hadoop/dfs/data`: *HDFS* filesystem data directory

Mandatory configuration:

* `CORE_CONF_fs_defaultFS`: *HDFS* address (i.e. `hdfs://<NAMENODE-HOST>:8020`)

*Docker-compose* template:

    datanode1:
      image: uhopper/hadoop-datanode
      hostname: datanode1
      container_name: datanode1
      domainname: hadoop
      net: hadoop
      volumes:
        - <DATANODE-VOLUME>:/hadoop/dfs/data
      environment:
        - GANGLIA_HOST=<GMOND-RECEIVER-HOST>
        - CORE_CONF_fs_defaultFS=hdfs://<NAMENODE-HOST>:8020

### resourcemanager

The *hadoop-resourcemanager* image starts an Hadoop
ResourceManager. (single instance)

Mandatory configuration:

* `CORE_CONF_fs_defaultFS`: *HDFS* address (i.e. `hdfs://<NAMENODE-HOST>:8020`)

*Docker-compose* template:

    resourcemanager:
      image: uhopper/hadoop-resourcemanager
      hostname: resourcemanager
      container_name: resourcemanager
      domainname: hadoop
      net: hadoop
      environment:
        - GANGLIA_HOST=<GMOND-RECEIVER-HOST>
        - CORE_CONF_fs_defaultFS=hdfs://<NAMENODE-HOST>:8020
        - YARN_CONF_yarn_log___aggregation___enable=true

Once running you can connect to `http://<CONTAINER_IP>:8088` to see
the webui.

### nodemanager

The *hadoop-nodemanager* image starts an Hadoop NodeManager. (multiple
instances) 

Mandatory configuration:

* `CORE_CONF_fs_defaultFS`: *HDFS* address (i.e. `hdfs://<NAMENODE-HOST>:8020`)
* `YARN_CONF_yarn_resourcemanager_hostname`: *resourcemanager* host

*Docker-compose* template:

    nodemanager1:
      image: uhopper/hadoop-nodemanager
      hostname: nodemanager1
      container_name: nodemanager1
      domainname: hadoop
      net: hadoop
      environment:
        - GANGLIA_HOST=<GMOND-RECEIVER-HOST>
        - CORE_CONF_fs_defaultFS=hdfs://<NAMENODE-HOST>:8020
        - YARN_CONF_yarn_resourcemanager_hostname=<RESOURCEMANAGER-HOST>
        - YARN_CONF_yarn_log___aggregation___enable=true
        - YARN_CONF_yarn_nodemanager_remote___app___log___dir=/app-logs

### spark

The *hadoop-spark* image is an utility container which provides a
Spark environment configured for the *hadoop* cluster.

The image itself doesn't specify any command since no service are
exposed. You are expected to specify it yourself via `docker run
uhopper/hadoop-spark <command>`.

A common approach is to keep the container alive using `tail -f
/var/log/dmesg` as command and then connect to it via `docker exec -ti
spark bash` to have a *spark* environment.

Mandatory configuration:

* `CORE_CONF_fs_defaultFS`: *HDFS* address (i.e. `hdfs://<NAMENODE-HOST>:8020`)
* `YARN_CONF_yarn_resourcemanager_hostname`: *resourcemanager* host

*Docker-compose* template:

    spark:
      image: uhopper/hadoop-spark
      hostname: spark
      container_name: spark
      domainname: hadoop
      net: hadoop
      environment:
        - CORE_CONF_fs_defaultFS=hdfs://namenode:8020
        - YARN_CONF_yarn_resourcemanager_hostname=resourcemanager
      command: tail -f /var/log/dmesg
