arm32v6 version
---------------

Alpine Linux now has a separate arm32v7 version. See `README.md.arm32v7`

```
TAG_VERSION=0.1.5
docker build --no-cache -t alpine-lighttpd-static:${TAG_VERSION} -f Dockerfile.arm32v6 .
docker run --name "my-lighttpd" --rm  -P -t -d \
	-v `pwd`/static:/var/www/htdocs \
	alpine-lighttpd-static-arm32v6:${TAG_VERSION}
docker exec -it my-lighttpd /bin/sh -i
cat /var/log/lighttpd/error.log
exit
docker stop <CONTAINER_ID>

docker tag  alpine-lighttpd-static:${TAG_VERSION} dpcrook/alpine-lighttpd-static:${TAG_VERSION}-arm32v6
docker push                                               dpcrook/alpine-lighttpd-static:${TAG_VERSION}-arm32v6
docker tag  alpine-lighttpd-static:${TAG_VERSION} dpcrook/alpine-lighttpd-static:arm32v6
docker push                                               dpcrook/alpine-lighttpd-static:arm32v6
# docker tag  alpine-lighttpd-static:${TAG_VERSION} dpcrook/alpine-lighttpd-static:latest
# docker push                                               dpcrook/alpine-lighttpd-static:latest
```

open https://hub.docker.com/r/dpcrook/alpine-lighttpd-static/tags
