<!--- -*- markdown -*- --->

#### arm32v7 version

Alpine Linux now has a arm32v7 version. `arm32v6/alpine` is aka `armhf`

```
TAG_VERSION=0.1.8
docker build --no-cache -t alpine-lighttpd-static-arm32v7:${TAG_VERSION} -f Dockerfile.arm32v7 .
docker run --name "my-lighttpd" --rm  -P -t -d \
	-v `pwd`/static:/var/www/htdocs \
	alpine-lighttpd-static-arm32v7:${TAG_VERSION}
docker exec -it my-lighttpd /bin/sh -i
docker stop <CONTAINER_ID>

docker tag  alpine-lighttpd-static-arm32v7:${TAG_VERSION} dpcrook/alpine-lighttpd-static:${TAG_VERSION}-arm32v7
docker push                                               dpcrook/alpine-lighttpd-static:${TAG_VERSION}-arm32v7
docker tag  alpine-lighttpd-static-arm32v7:${TAG_VERSION} dpcrook/alpine-lighttpd-static:latest
docker tag  alpine-lighttpd-static-arm32v7:${TAG_VERSION} dpcrook/alpine-lighttpd-static:arm32v7
docker push                                               dpcrook/alpine-lighttpd-static:latest
docker push                                               dpcrook/alpine-lighttpd-static:arm32v7
```
