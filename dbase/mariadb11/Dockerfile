# image mariadb
FROM mariadb:11.8.3

# variables d'environnement
ENV MARIADB_ROOT_PASSWORD=root
ENV MARIADB_DATABASE=db_users
ENV MARIADB_USER=user1
ENV MARIADB_PASSWORD=1234

EXPOSE 3306

## met a jour la liste des pacquets disponible
#RUN apt-get update

## installe openssh client et server
#RUN apt-get install -y --fix-missing openssh-client openssh-server

## crée une image docker
# docker build . -t darkb1967/gestion-utilisateurs-database

## construire un contenaire sans volume
# docker run -d -p 3310:3306 --name gestion-utilisateurs-database  darkb1967/gestion-utilisateurs-database:1.0

## construire un contenaire avec volume
# docker run -d -p 3310:3306 -v gestion-utilisateurs-data:/var/lib/mysql --name gestion-utilisateurs-database darkb1967/gestion-utilisateurs-database:1.0
# docker run -d -p 3310:3306 -v gestion-utilisateur-data:/var/lib/mysql darkb1967/gestion-utilisateurs-database:1.0

## entre dans le contenaire dans le bash
# docker exec -it gestion-utilisateurs-database /bin/bash

## commande de gestion volume
# docker volume ls
# docker image ls (ou images) 
# docker volume create mariadb-data
# docker inspect volume mariadb-data