# Sample Spark Write Application

Jar file can be downloaded with "example" make target from git root.

* Compiled with scala 2.11.12
* For Spark 2.1.0

The application is very simple and is listed below. The full project can be found [here](https://github.com/earthquakesan/SparkWriteApplication).
```
package org.ermilov

import org.apache.spark.{SparkConf, SparkContext}

object SparkWriteApplication extends App {
  val config = new SparkConf().setMaster("spark://spark-master:7077").setAppName("SparkWriteApplication")
  val sc = new SparkContext(config)

  val numbersRdd = sc.parallelize((1 to 10000).toList)
  numbersRdd.saveAsTextFile("hdfs://namenode:8020/tmp/numbers-as-text")
}
```

## How to run (see Makefile in git root)
```
make example
```

To remove created data run:
```
make clean-example
```

