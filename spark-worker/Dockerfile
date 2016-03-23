FROM bde2020/hadoop-spark
MAINTAINER Ivan Ermilov <ivan.s.ermilov@gmail.com>

ADD spark-worker-entrypoint.sh /spark-worker-entrypoint.sh
RUN chmod a+x /spark-worker-entrypoint.sh

ENTRYPOINT ["/spark-worker-entrypoint.sh"]
