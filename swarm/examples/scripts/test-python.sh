#!/bin/bash

echo "### Python HDFS test ###"

cd /hdfs
cd hdfs/examples
pip list
python json.py
python dataframe.py


