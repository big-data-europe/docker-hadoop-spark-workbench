# How to use HDFS/Spark Workbench

To start an HDFS/Spark Workbench:
```
    docker network create hadoop
    docker-compose up -d
```

To scale up spark-workers:
```
    docker-compose scale spark-worker=3
```

## Docs
* [Motivation behind the repo and an example usage @BDE2020 Blog](http://www.big-data-europe.eu/scalable-sparkhdfs-workbench-using-docker/)
