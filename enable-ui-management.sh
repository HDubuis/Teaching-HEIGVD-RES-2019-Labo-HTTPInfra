docker volume create portainer_data
docker run -d -p 9000:9000 --name ui -v /var/run/docker.sock -v portainer_data:/data portainer/portainer
read -p "Press [Enter] key to start backup..."