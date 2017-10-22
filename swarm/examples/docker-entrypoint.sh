#!/bin/bash

ls -alh

scripts/wait-for-hadoop.sh
scripts/test-java.sh
scripts/test-python.sh



sleep infinity