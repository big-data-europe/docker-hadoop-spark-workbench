# Running Hadoop and Spark in Swarm cluster

## Setup dnsmasq for local deployment

dnsmasq in required for local traefik setup. When deploying on real swarm cluster, this step is unnecessary, simply modify traefik setup to use your registered domain name.

Install dnsmasq:

```
sudo apt-get install dnsmasq
```

Inject local.host domain into dnsmasq and restart the service:

```
echo "address=/local.host/127.0.0.1" | sudo tee /etc/dnsmasq.d/workbench.conf
sudo systemctl restart dnsmasq
```

Check that it worked (both pings should work, resolves to 127.0.0.1):
```
ping local.host
ping namenode.local.host
```

## Initial setup

Create an overlay network:
```
make network
```

Deploy traefik:
```
make traefik
```

Now navigate to localhost:8080 (or yourserver:8080) and check that traefik is running.

## Deploying HDFS (without YARN)

There is no need to explicitly pull the images, however doing it this way you can see the download progress.
In case of multiple server deployment, if you pull only on your swarm manager, the images still need to be pulled on other nodes.
Pull the images:
```
docker-compose -f docker-compose-hadoop.yml pull
```

To deploy HDFS run:
```
make hadoop
```

Go to traefik again and check if hadoop is running, copy/paste generated domain name into browser and check if namenode/datanode is working as well.

## Deploying Spark

Pull the images:
```
docker-compose -f docker-compose-spark.yml pull
```

Deploy Spark:
```
make spark
```

## Deploying Apache Zeppelin and HDFS Filebrowser

Pull the images:
```
docker-compose -f docker-compose-services.yml pull
```

Deploy the services:
```
make services
```

Navigate to traefik and go to HDFS Filebrowser/Apache Zeppelin from there.
