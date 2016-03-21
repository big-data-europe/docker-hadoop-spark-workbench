FROM aksw/hadoop-spark

ADD spark-master-entrypoint.sh /spark-master-entrypoint.sh
RUN chmod a+x /spark-master-entrypoint.sh

ENTRYPOINT ["/spark-master-entrypoint.sh"]
