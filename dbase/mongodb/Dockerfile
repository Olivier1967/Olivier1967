# image mongodb
FROM mongo:8.0.13

ENV MONGO_INITDB_ROOT_USERNAME=olive
ENV MONGO_INITDB_ROOT_PASSWORD=1234


EXPOSE 27017

# docker build . -t mymongodb

# sans volume
# docker run -d -p 4005:27017 --name mongodb1 mymongodb

# avec volume
# docker run --name mongodb1 -p 4005:27017 -d -v mongodb-data:/data/db -v mongodb-config:/data/configdb mymongodb ## cree un volume docker

# bash
# docker exec -it mongodb1 bash   ## entre dans le contenaire dans le bash

# commande mongo pour login et creation db
# mongosh -u "olive" -p "1234"
# use people
# db.people.insertOne({ nom: "exemple", prenom: "exemple2"})
# db.people.find()
# db.stats()
# show dbs

# mongodb://olive:1234@localhost:4005/ # mongodb compass connexion