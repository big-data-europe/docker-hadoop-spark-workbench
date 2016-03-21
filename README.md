# How to use docker-compose

To start a cluster:
```
    docker-compose up -d
```

To scale up spark-workers:
```
    docker-compose scale spark-worker=3
```

## Notes
Hadoop/Spark dockerfiles were forked from https://bitbucket.org/uhopper/hadoop-docker
