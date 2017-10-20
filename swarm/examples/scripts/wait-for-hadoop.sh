#!/bin/bash

echo "Check HDFS connectivity with telnet"
function wait_telnet()
{
   
    
    local service=$1
    local port=$2
    local retry_seconds=5
    local max_try=100
    let i=1
    result=$(echo exit | telnet namenode 50070 2>&1 | grep -i  "Connection refused"  | wc -l)
    until [ $result -eq 0 ]; do
      echo "[$i/$max_try] check for ${service}..."
      echo "[$i/$max_try] ${service} is not available yet"
      if (( $i == $max_try )); then
        echo "[$i/$max_try] ${service} is still not available; giving up after ${max_try} tries. :/"
        exit 1
      fi
      
      echo "[$i/$max_try] try in ${retry_seconds}s once again ..."
      let "i++"
      sleep $retry_seconds

      result=$(echo exit | telnet namenode 50070 2>&1 | grep -i  "Connection refused"  | wc -l)
    
    done
    echo "[$i/$max_try] $service is available by telnet."

}

SERVICE_PRECONDITION=("namenode")

for i in "${SERVICE_PRECONDITION[@]}"
do
    wait_telnet ${i}
done