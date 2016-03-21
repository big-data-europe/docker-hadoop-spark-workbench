FROM aksw/hadoop

ENV APACHE_SPARK_VERSION 1.6.1
ENV APACHE_HADOOP_VERSION 2.7.1

RUN set -x \
    && curl -fSL "https://dl.dropboxusercontent.com/u/4882345/spark-notebook/spark-notebook-0.6.3-scala-2.11.7-spark-1.6.1-hadoop-2.7.1-with-hive-with-parquet.tgz" -o /tmp/spark-notebook.tgz \
    && tar -xzvf /tmp/spark-notebook.tgz -C /opt/ \
    && mv /opt/spark-notebook-* /opt/spark-notebook \
    && rm /tmp/spark-notebook.tgz

COPY run.sh /run.sh
RUN chmod a+x /run.sh

WORKDIR /opt/spark-notebook/

CMD ["/run.sh"]
