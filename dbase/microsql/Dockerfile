FROM mcr.microsoft.com/mssql/server:2019-latest

ENV ACCEPT_EULA=Y

ENV MSSQL_SA_PASSWORD=123abc@MICRO 
## connexion echoué

# ENV MSSQL_SA_PASSWORD=123abcMICRO 

# ENV MSSQL_SA_PASSWORD=Micro123



# docker build . -t microsql ## construire une image a partir de rien

# docker run -d -p 4004:1433 --name microsql1 microsql

# docker exec -it microsql1 "bash"   ## entre dans le contenaire dans le bash

# /opt/mssql-tools18/bin/sqlcmd -S localhost -U <userid> -P "12345678" ## se connecter au server local avec sqlcmd


# crée un volume à la volée
# docker run -p 4004:1433 --name microsql1  --volume microsql-data:/var/opt/mssql -d microsql