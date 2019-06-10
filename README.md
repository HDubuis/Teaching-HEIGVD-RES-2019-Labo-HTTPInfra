# Teaching-HEIGVD-RES-2018-Labo-HTTPInfra

### Isaia Spinelli et Tommy Geradi

## Step 3: Reverse proxy with apache (static configuration)

### Pour tester l'implémentation
1. Cloner le repo
2. Récupérer et aller sur la branche fb-apache-reverse-proxy
3. Aller dans le repertoire images-docker/apache-reverse-proxy
4. Faire une resolution DNS sur votre machine (fichier hosts en admin) entre votre IP docker et demo.res.ch
5. Assurer vous que tous les containers sont kill pour le bon fonctionnement de cette étape.
5. Aller a la racine, et lancer le script "script_run_all.sh". Il devrait lancer les 3 images faits jusqu'ici et les lier grâce à la configuration.
5. Dans le naviguateur, aller sur http://demo.res.ch:8080/ pour accéder au contenu du docker statique et
il est possible d'accéder seulement au tableau random générer par la partie dynmaic sur http://demo.res.ch:8080/api/animals/

Dans cette partie, nous avons du configurer le fichier "xxx-reverse-proxy.conf" que nous avons nommé "001-reverse-proxy.conf"
afin de faire le "mapping" des requêtes sur les dockers et donné un nom au serveur (demo.res.ch).

Pour le dockerFile, nous avons eu besoin de copier notre dossier de configuration dans le docker
COPY conf/ /etc/apache2

Ensuite, lancer les commande de apache2 afin d'activer les configurations et les sites.
RUN a2enmod proxy proxy_http
RUN a2ensite 000-* 001-*


### Webcasts

* [Labo HTTP (3a): reverse proxy apache httpd dans Docker](https://www.youtube.com/watch?v=WHFlWdcvZtk)
* [Labo HTTP (3b): reverse proxy apache httpd dans Docker](https://www.youtube.com/watch?v=fkPwHyQUiVs)
* [Labo HTTP (3c): reverse proxy apache httpd dans Docker](https://www.youtube.com/watch?v=UmiYS_ObJxY)


### Acceptance criteria

* You have a GitHub repo with everything needed to build the Docker image for the container.
* You can do a demo, where you start from an "empty" Docker environment (no container running) and where you start 3 containers: static server, dynamic server and reverse proxy; in the demo, you prove that the routing is done correctly by the reverse proxy.
* You can explain and prove that the static and dynamic servers cannot be reached directly (reverse proxy is a single entry point in the infra). 
* You are able to explain why the static configuration is fragile and needs to be improved.
* You have **documented** your configuration in your report.


## Step 4: AJAX requests with JQuery

### Webcasts

* [Labo HTTP (4): AJAX avec JQuery](https://www.youtube.com/watch?v=fgpNEbgdm5k)

### Acceptance criteria

* You have a GitHub repo with everything needed to build the various images.
* You can do a complete, end-to-end demonstration: the web page is dynamically updated every few seconds (with the data coming from the dynamic backend).
* You are able to prove that AJAX requests are sent by the browser and you can show the content of th responses.
* You are able to explain why your demo would not work without a reverse proxy (because of a security restriction).
* You have **documented** your configuration in your report.

## Step 5: Dynamic reverse proxy configuration

### Webcasts

* [Labo HTTP (5a): configuration dynamique du reverse proxy](https://www.youtube.com/watch?v=iGl3Y27AewU)
* [Labo HTTP (5b): configuration dynamique du reverse proxy](https://www.youtube.com/watch?v=lVWLdB3y-4I)
* [Labo HTTP (5c): configuration dynamique du reverse proxy](https://www.youtube.com/watch?v=MQj-FzD-0mE)
* [Labo HTTP (5d): configuration dynamique du reverse proxy](https://www.youtube.com/watch?v=B_JpYtxoO_E)
* [Labo HTTP (5e): configuration dynamique du reverse proxy](https://www.youtube.com/watch?v=dz6GLoGou9k)

### Acceptance criteria

* You have a GitHub repo with everything needed to build the various images.
* You have found a way to replace the static configuration of the reverse proxy (hard-coded IP adresses) with a dynamic configuration.
* You may use the approach presented in the webcast (environment variables and PHP script executed when the reverse proxy container is started), or you may use another approach. The requirement is that you should not have to rebuild the reverse proxy Docker image when the IP addresses of the servers change.
* You are able to do an end-to-end demo with a well-prepared scenario. Make sure that you can demonstrate that everything works fine when the IP addresses change!
* You are able to explain how you have implemented the solution and walk us through the configuration and the code.
* You have **documented** your configuration in your report.

## Additional steps to get extra points on top of the "base" grade

### Load balancing: multiple server nodes (0.5pt)

* You extend the reverse proxy configuration to support **load balancing**. 
* You show that you can have **multiple static server nodes** and **multiple dynamic server nodes**. 
* You prove that the **load balancer** can distribute HTTP requests between these nodes.
* You have **documented** your configuration and your validation procedure in your report.

### Load balancing: round-robin vs sticky sessions (0.5 pt)

* You do a setup to demonstrate the notion of sticky session.
* You prove that your load balancer can distribute HTTP requests in a round-robin fashion to the dynamic server nodes (because there is no state).
* You prove that your load balancer can handle sticky sessions when forwarding HTTP requests to the static server nodes.
* You have documented your configuration and your validation procedure in your report.

### Dynamic cluster management (0.5 pt)

* You develop a solution, where the server nodes (static and dynamic) can appear or disappear at any time.
* You show that the load balancer is dynamically updated to reflect the state of the cluster.
* You describe your approach (are you implementing a discovery protocol based on UDP multicast? are you using a tool such as serf?)
* You have documented your configuration and your validation procedure in your report.

### Management UI (0.5 pt)

* You develop a web app (e.g. with express.js) that administrators can use to monitor and update your web infrastructure.
* You find a way to control your Docker environment (list containers, start/stop containers, etc.) from the web app. For instance, you use the Dockerode npm module (or another Docker client library, in any of the supported languages).
* You have documented your configuration and your validation procedure in your report.
