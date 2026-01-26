# image postgres
FROM postgres:16

# variables d'environnement
ENV POSTGRES_ROOT_PASSWORD=root
ENV POSTGRES_DB=mydatabase
ENV POSTGRES_USER=olive
ENV POSTGRES_PASSWORD=1234


# docker build . -t postgres2503 ## construire une image a partir de rien

# docker run -d -p 4003:5432 --name postgres1 -e POSTGRES_ROOT_PASSWORD=root postgres2503

# docker exec -it postgres /bin/bash   ## entre dans le contenaire dans le bash


# arreter le docker et l'effacer
# docker stop postgres1
# docker rm postgres1

# docker volume create postgres-data ## crée un volume qui s'efface pas, mais le crée avec un "run"

# docker inspect volume postgres-data ## regarder ce qu'il y a dedans

# docker volume ls ## lister le volumes

# docker volume prune ## tuer les volumes pas en activiter


# docker run --name postgres1 -d -p 4003:5432 -v postgres-data:/var/lib/postgresql/data postgres2503 ## pour un docker avec volume