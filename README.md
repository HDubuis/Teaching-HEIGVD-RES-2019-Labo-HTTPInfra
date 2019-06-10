# Teaching-HEIGVD-RES-2018-Labo-HTTPInfra

### Isaia Spinelli et Tommy Gerardi


images docker : https://hub.docker.com/
Template : https://startbootstrap.com/themes/

## 1. Static HTTP server with apache httpd

**branch : master**

### Pour tester l'implémentation

1. cloner le repo
2. lancer le script qui build l'image (.\images-docker\apache-php-image\script_build.sh)
3. lancer le script qui run un containers avec le script (script_run.sh, la redirection de port peut être modifié)
4. Dans un naviguateur, tapez : 192.168.99.100:9090

### Template utilisé

https://startbootstrap.com/templates/blog-home/

### Suite

Pull la branche fb-express-dynamic.



## 2. Dynamic HTTP server with express.js



**branch : fb-express-dynamic**

### Pour tester l'implémentation

1. Cloner le repo
2. Récupérer et aller sur la branche **fb-express-dynamic**
3. Aller dans le repertoire express-image
4. lancer le script qui build l'image (script_build.sh)
5. lancer le script qui run un containers avec le script (script_run.sh, la redirection de port peut être modifié)
6. Dans un naviguateur, tapez : http://192.168.99.100:9292/

### Suite

Pull la branche fb-apache-reverse-proxy.



## Step 3: Reverse proxy with apache (static configuration)

### Pour tester l'implémentation

1. Cloner le repo
2. Récupérer et aller sur la branche fb-apache-reverse-proxy
3. Aller dans le répertoire images-docker/apache-reverse-proxy
4. Faire une résolution DNS sur votre machine (fichier hosts en admin) entre votre IP docker et demo.res.ch
5. Assurez-vous que tous les containers sont kill pour le bon fonctionnement de cette étape.
6. Builder l'image dans .\images-docker\apache-reverse-proxy avec script_build.sh.
7. Aller a la racine, et lancer le script "script_run_all.sh". Il devrait lancer les 3 images faites jusqu'ici et les lier grâce à la configuration.
8. Dans le naviguateur, aller sur http://demo.res.ch:8080/ pour accéder au contenu du docker statique et
   il est possible d'accéder seulement au tableau random générer par la partie dynmaic sur http://demo.res.ch:8080/api/animals/

Dans cette partie, nous avons du configurer le fichier "xxx-reverse-proxy.conf" que nous avons nommé "001-reverse-proxy.conf"
afin de faire le "mapping" des requêtes sur les dockers et donné un nom au serveur (demo.res.ch).

Pour le dockerFile, nous avons eu besoin de copier notre dossier de configuration dans le docker
COPY conf/ /etc/apache2

Ensuite, lancer les commande de apache2 afin d'activer les configurations et les sites.
RUN a2enmod proxy proxy_http
RUN a2ensite 000-* 001-*



### Suite

Pull la branche fb-ajax.



## Step 4: requêtes AJAX avec JQuery

### Pour tester l'implémentation

1. Cloner le repo
2. Récupérer et aller sur la branche fb-ajax
3. Aller dans le repertoire images-docker/apache-reverse-proxy
4. Faire une resolution DNS sur votre machine (fichier hosts en admin) entre votre IP docker et demo.res.ch
5. Assurer vous que tous les containers sont kill pour le bon fonctionnement de cette étape.
6. Aller a la racine, et lancer le script "script_run_all.sh". 
7. Dans le naviguateur, aller sur http://demo.res.ch:8080/ et il est maintenant possible de voir la page statique et une modification toutes les 2 secondes sur le second titre du premier animal du tableau récupéré via une requête faite dans le JS de la partie au JS de la partie dynamique.



### Suite

Pull la branche fb-dynamic-reverse.



## Step 5: Configuration du proxy inverse dynamique

**branche : fb-dynamic-reverse**

### 

### Pour tester l'implémentation

Dans la partie reverse statique, il était important que tous les containers soit killés afin de savoir quelle addresses IPs aurait les dockers. Maintenant, le but est de pouvoir s'en fiche de l'ordre ou de si d'autre container tourne.

Pour ce faire, il a fallut écrire du code PHP afin de réecrire notre configuration en récupérant des variables d'environment pour les addresses et ports des containers utilisés. Voici une marche à suivre pour mieux comprendre:

1. Cloner le repo
2. Faire une resolution DNS sur votre machine (fichier hosts en admin) entre votre IP docker et demo.res.ch
3. Aller a la racine, et lancer le script "script_run_all.sh". Ce script va lancé les containers statique et dynamique et vous afficher les adresses IPs
4. Dans le naviguateur, aller sur <http://demo.res.ch:8080/>



## Dynamic cluster management (0.5 pt)

branche : fb-traefik

### Objectives

Avoir un cluster management dynamique.

### Pour tester l'implémentation

1. Cloner le repo 
2. Faire une résolution DNS sur votre machine (fichier hosts en admin) entre votre docker IP et demo.res.ch
3. Allez à la racine et lancez le script "script_run_all.sh".
4. Lorsque demandé, entrez la commande affichée au terminal dans le terminal docker pour lancer traefik, ensuite appuyez sur enter pour continuer le script
5. Dans le naviguateur, aller sur http://demo.res.ch:9090 pour avoir l'ui de traefik.
6. Vous pouvez observer ce qui se passe.
7. On voit les plusieurs serveurs statiques et dynamiques

### Observation

On peut voir qu'on a créé 3 serveurs statiques et 3 dynamiques  avec le script. Si on en kill un, on le voit disparaître de l'ui traefik. C'est grâce au "watch = true" sous [docker] dans le traefik.toml.



## Load balancing: round-robin vs sticky sessions (0.5 pt)

branche : fb-traefik

### Objectives

Avoir des sticky sessions

### Observation

Dans les Dockerfile des serveurs, on a mis les labels "traefik.backend.loadbalancer.stickiness"="true" afin d'avoir des sticky sessions.



## Management UI (0.5 pt)

**branche : fb-ui**

### Objectives

l'objectif est d'avoir une interface utilisateur afin de manager docker.

### Pour tester l'implémentation

1. Cloner le repo 

2. Faire une résolution DNS sur votre machine (fichier hosts en admin) entre votre docker IP et demo.res.ch

3. Allez à la racine et lancez le script "script_run_all.sh".

4. Lancez les deux commandes suivantes dans le terminal docker :

   docker volume create portainer_data
   docker run -d -p 9000:9000 --name ui -v "/var/run/docker.sock:/var/run/docker.sock" -v portainer_data:/data portainer/portainer

5. Dans le naviguateur, aller sur http://demo.res.ch:9000/

6. Crééz un compte

7. Sélectionnez local et connect