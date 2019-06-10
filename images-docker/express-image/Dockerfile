FROM node:10.16
MAINTAINER Isaia Spinelli <isaia.spinelli@heig-vd.ch>


RUN apt-get update && apt-get install -y vim


# Traefik configuration
LABEL "traefik.backend"="apinode"
LABEL "traefik.backend.loadbalancer.stickiness"="true"
LABEL "traefik.frontend.rule"="PathPrefixStrip: /api/animals/"
LABEL "traefik.port"="3000"

COPY src/ /opt/app

CMD ["node", "/opt/app/index.js"]