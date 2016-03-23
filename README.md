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
* [Motivation behind the repo and an example usage @BDE2020 Blog](http://www.big-data-europe.eu/scalable-sparkhdfs-workbench-using-docker/)

## Notes
Hadoop/Spark dockerfiles were forked from https://bitbucket.org/uhopper/hadoop-docker
