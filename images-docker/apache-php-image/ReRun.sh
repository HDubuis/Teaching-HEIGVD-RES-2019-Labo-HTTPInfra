#!/bin/bash

# kill containers running
docker kill apache_static
# kill stopped
docker rm $(docker ps -a -q)
# build
docker build -t res_apache_php .
# run 
docker run -d --name apache_static res_apache_php
# docker run -d --name apache_static res_apache_php