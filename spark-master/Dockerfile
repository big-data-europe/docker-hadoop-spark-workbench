FROM bde2020/hadoop-spark
MAINTAINER Ivan Ermilov <ivan.s.ermilov@gmail.com>

ADD spark-master-entrypoint.sh /spark-master-entrypoint.sh
RUN chmod a+x /spark-master-entrypoint.sh

ENTRYPOINT ["/spark-master-entrypoint.sh"]
