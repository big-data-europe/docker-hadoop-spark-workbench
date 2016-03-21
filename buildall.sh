#!/bin/sh

for i in hadoop namenode datanode resourcemanager nodemanager historyserver spark spark-master spark-worker spark-notebook ant huebuildenv hue; do
    ( cd $i && ./build.sh)
done
