# Cheese

Une simple application web

## Usage

```bash
docker build --build-arg NGINX_VERSION=1.29.1-alpine3.22 --target live -t cheese:live .
docker stop $cid
cid=$(docker run --rm --detach --publish 80:80 cheese:live)
```
