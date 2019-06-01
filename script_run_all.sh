#!/bin/bash

# 1 kill les 3
# 2 
# docker rm `docker ps -qa`

# run static apache
# http://demo.res.ch:8080/
docker run -d res_apache_php
# run dynamic express
# http://demo.res.ch:8080/api/animals/
docker run -d res_express
# run proxy reverse
docker run -d -p 8080:80 res/apache_rp
