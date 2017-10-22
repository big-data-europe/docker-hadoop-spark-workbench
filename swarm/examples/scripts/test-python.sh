#!/bin/bash

echo "### Python HDFS test ###"

cd /hdfs
cd hdfs/examples
pip list
python json-example.py
python dataframe-example.py


