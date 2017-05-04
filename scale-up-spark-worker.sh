#!/bin/bash

if [ $# -lt 1 ]; then
    echo "*** ERROR: need argument like spark-worker=3"
    echo "Usage: ${0:-basename} <N>"
    echo "where <N>: number of spark-workers"
    echo "e.g."
    echo "   ${0:-basename} 3"
    exit 1
fi
docker-compose scale spark-worker=$1
