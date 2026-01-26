# image mysql 5.7.27
FROM mysql:5.7

# variables d'environnement
ENV MYSQL_ROOT_PASSWORD=root
ENV MYSQL_DATABASE=mydatabase
ENV MYSQL_USER=oliver
ENV MYSQL_PASSWORD=1234

# docker build . -t mysql57 ## construire une image a partir de rien

# docker run -d -p 4002:3306 --name mysql57a -e MYSQL_ROOT_PASSWORD=root mysql57

# docker exec -it mysql57a /bin/bash   ## entre dans le contenaire dans le bash


# arreter le docker et l'effacer
# docker stop mysql57a
# docker rm mysql57a

# docker volume create mysql57-data ## crée un volume qui s'efface pas

# docker inspect volume mysql57db-data ## regarder ce qu'il y a dedans

# docker volume ls ## lister le volumes

# docker volume prune ## tuer les volumes pas en activiter


# docker run --name mysql57a -d -p 4002:3306 -e MYSQL_ROOT_PASSWORD=root -v mysql57-data:/var/lib/mysql/ mysql57 ## pour un docker avec volume