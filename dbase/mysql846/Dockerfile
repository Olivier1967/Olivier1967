# image mysql
FROM mysql:8.4.6

# variables d'environnement
ENV MYSQL_ROOT_PASSWORD=root
ENV MYSQL_DATABASE=mydatabase
ENV MYSQL_USER=oliver
ENV MYSQL_PASSWORD=1234


# docker build . -t mysqldb ## construire une image a partir de rien

# docker run -d -p 4001:3306 --name mysql1 -e MYSQL_ROOT_PASSWORD=root mysqldb

# docker exec -it mysql1 /bin/bash   ## entre dans le contenaire dans le bash


# arreter le docker et l'effacer
# docker stop mysql1
# docker rm mysql1

# docker volume create mysqldb-data ## crée un volume qui s'efface pas

# docker inspect volume mysqldb-data ## regarder ce qu'il y a dedans

# docker volume ls ## lister le volumes

# docker volume prune ## tuer les volumes pas en activiter


# docker run --name mysql1 -d -p 4001:3306 -e MYSQL_ROOT_PASSWORD=root -v mysqldb-data:/var/lib/mysql/ mysqldb ## pour un docker avec volume






