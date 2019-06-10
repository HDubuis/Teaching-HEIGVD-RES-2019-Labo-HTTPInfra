FROM php:7.2-apache
MAINTAINER Isaia Spinelli <isaia.spinelli@heig-vd.ch>

RUN apt-get update && apt-get install -y vim

#Labels traefik
LABEL "traefik.backend"="httpnode"
LABEL "traefik.backend.loadbalancer.stickiness"="true"
LABEL "traefik.frontend.rule"="PathPrefix: /"
LABEL "traefik.port"="80"

COPY content/ /var/www/html/