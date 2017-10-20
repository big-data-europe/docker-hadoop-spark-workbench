# Prepare images

Currently HDFS installation comes from the online resources of the project BDE 2020.
For the custom example container, please do:

$ cd examples
$ docker build -t hdfs_examples:latest

# Deploy Swarm

$ ./deploy-swarm.sh

# Check test output

The hdfs_examples service container with examples provides Java and Python examples for HDFS.

$ docker service logs hdfs_examples

E.g. Java test output should look like:
...
Oct 20, 2017 8:16:41 PM io.saagie.example.hdfs.Main main
INFO: Begin Write file into hdfs
Oct 20, 2017 8:16:41 PM io.saagie.example.hdfs.Main main
INFO: End Write file into hdfs
Oct 20, 2017 8:16:41 PM io.saagie.example.hdfs.Main main
INFO: Read file into hdfs
Oct 20, 2017 8:16:41 PM io.saagie.example.hdfs.Main main
INFO: hello;world
...


# Extend and integrate examples to your solution

Check provided GitHub sources in GitHub and HDFS documentation.