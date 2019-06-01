FROM node:10.16
MAINTAINER Isaia Spinelli <isaia.spinelli@heig-vd.ch>


RUN apt-get update && apt-get install -y vim

COPY src/ /opt/app

CMD ["node", "/opt/app/index.js"]