FROM iais.nm/env-ci-web-ubuntu16

RUN apt-get -y update && apt-get -y install git python-setuptools python-dev build-essential python-pip telnet
RUN python --version && pip --version && javac -version
RUN pip install hdfs


WORKDIR /hdfs
COPY scripts /hdfs/scripts
RUN chmod +x /hdfs/scripts

RUN git clone https://github.com/mtth/hdfs.git
RUN git clone https://github.com/saagie/example-java-read-and-write-from-hdfs.git && cd example-java-read-and-write-from-hdfs && mvn package 
ADD docker-entrypoint.sh /hdfs/docker-entrypoint.sh
ENTRYPOINT /hdfs/docker-entrypoint.sh