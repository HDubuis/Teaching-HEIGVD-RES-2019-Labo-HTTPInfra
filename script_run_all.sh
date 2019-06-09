#!/bin/bash

# 1 kill les 3
docker kill apache_static
docker kill express_dynamic
docker kill apache_rp
# 2 kill stopped
# docker rm `docker ps -qa`
docker rm $(docker ps -a -q)

# 3 rebuild
bash ./images-docker/apache-php-image/script_build.sh
bash ./images-docker/apache-reverse-proxy/script_build.sh
bash ./images-docker/express-image/script_build.sh

# run static apache
# http://demo.res.ch:8080/
docker run -d --name apache_static res_apache_php
# run dynamic express
# http://demo.res.ch:8080/api/animals/
docker run -d --name express_dynamic res_express
# run proxy reverse
# en static !!!
# docker run -d -p 8080:80 --name apache_rp res/apache_rp

# docker inspect <ID_docker_ps ou name> | grep "IPA"

# Affiche les IPs des containers 
echo "IP Static : (port:80)"
docker inspect apache_static | grep "IPAddress"
echo "IP Dynamic : (port:3000)"
docker inspect express_dynamic | grep "IPAddress"


# en static !!!
# docker inspect apache_rp | grep "IPA"

echo $(docker inspect -f "{{ .NetworkSettings.IPAddress }}" apache_static):80
echo $(docker inspect -f "{{ .NetworkSettings.IPAddress }}" express_dynamic):3000
# lance le proxy en dynamic a changer les IPs avec ce qui est afficher par le script
docker run -d -e STATIC_APP=$(docker inspect -f "{{ .NetworkSettings.IPAddress }}" apache_static):80 -e DYNAMIC_APP=$(docker inspect -f "{{ .NetworkSettings.IPAddress }}" express_dynamic):3000 --name apache_rp -p 8080:80 res/apache_rp

#enable the ui
bash ./enable-ui-management.sh

# Permet de laisser le temps de voir ce qui s'est passe
read -p "Press [Enter] key to start backup..."