# syntax=docker/dockerfile:1.17.1
ARG NGINX_VERSION=1.29.1-alpine3.22

################################################################################
FROM nginx:$NGINX_VERSION AS base

################################################################################
FROM base AS dev

ENV LODASH_URL=https://cdnjs.cloudflare.com/ajax/libs/lodash.js/4.17.21/lodash.js
ADD --chmod=0444 \
	$LODASH_URL \
	/usr/share/nginx/html
COPY index.html index.css index.js /usr/share/nginx/html/

################################################################################
FROM base AS live

ARG LODASH_MIN_URL=https://cdnjs.cloudflare.com/ajax/libs/lodash.js/4.17.21/lodash.min.js
ADD --chmod=0444 \
	$LODASH_MIN_URL \
	/usr/share/nginx/html
RUN touch /usr/share/nginx/html/favicon.ico
COPY index.html index.css index.js /usr/share/nginx/html/
RUN sed -i /usr/share/nginx/html/index.html -e 's/lodash\.js/lodash.min.js/'
