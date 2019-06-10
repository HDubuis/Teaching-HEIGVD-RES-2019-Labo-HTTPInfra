# Teaching-HEIGVD-RES-2018-Labo-HTTPInfra

### Isaia Spinelli et Tommy Gerardi 


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







