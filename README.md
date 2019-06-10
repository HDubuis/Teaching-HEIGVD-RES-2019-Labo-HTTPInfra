# Teaching-HEIGVD-RES-2018-Labo-HTTPInfra

### Isaia Spinelli et Tommy Gerardi 


## Management UI 

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

* Afin d'avoir l'UI pour manager docker il suffit de lancer les 2 commandes qui suivent (attention, elles doivent être lancées avec le terminal docker!) :
* docker volume create portainer_data
  docker run -d -p 9000:9000 --name ui -v "/var/run/docker.sock:/var/run/docker.sock" -v portainer_data:/data portainer/portainer
* Vous pourrez ensuite accéder à l'UI à l'adresse "demo.res.ch:9000" (à condition que le reste)