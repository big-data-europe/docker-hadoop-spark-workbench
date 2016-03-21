# How to use docker-compose

To start a cluster:
```
    ./buildall.sh
    docker-compose up -d
```

To scale up spark-workers:
```
    docker-compose scale spark-worker=3
```

## Docs
* [Motivation behind the repo and an example usage](https://medium.com/@ivanermilov/scalable-spark-hdfs-setup-using-docker-2fd0ffa1d6bf)

## Notes
Hadoop/Spark dockerfiles were forked from https://bitbucket.org/uhopper/hadoop-docker
