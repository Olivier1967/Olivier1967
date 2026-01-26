# image php
FROM php:8.2-apache

WORKDIR /var/www/html/
# copy fichier dans workdir
# COPY index.php contact.php /var/www/html/


# ouvrir les port
EXPOSE 80

## crée une image docker
# docker build . -t darkb1967/php82_apache

## construire un contenaire avec volume
# docker run -d -p 8080:80 -v php-data:/var/www/html --name php_cont1 darkb1967/php82_apache
# -v "$PWD":/var/www/html