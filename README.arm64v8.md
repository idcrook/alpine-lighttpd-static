<!--- -*- markdown -*- --->

Build arm64v8 version
=====================

```
TAG_VERSION=0.1.14-arm64v8
sudo docker build --no-cache -t alpine-lighttpd-static:${TAG_VERSION} -f Dockerfile.arm64v8 .
sudo docker run --name "my-lighttpd" --rm  -P -t -d \
	-v `pwd`/static:/var/www/htdocs \
	alpine-lighttpd-static:${TAG_VERSION}
sudo docker exec -it my-lighttpd /bin/sh -i
# grep ^ /var/log/lighttpd/*.log
# ls -l /var/lib/lighttpd/cache/deflate/
# exit
sudo docker stop <CONTAINER_ID>

sudo docker login
sudo docker tag  alpine-lighttpd-static:${TAG_VERSION} dpcrook/alpine-lighttpd-static:${TAG_VERSION}
sudo docker push                                       dpcrook/alpine-lighttpd-static:${TAG_VERSION}
sudo docker tag  alpine-lighttpd-static:${TAG_VERSION} dpcrook/alpine-lighttpd-static:latest-arm64v8
sudo docker push                                       dpcrook/alpine-lighttpd-static:latest-arm64v8


# FIXME: add multi-arch manifest support
# docker tag  alpine-lighttpd-static:${TAG_VERSION} dpcrook/alpine-lighttpd-static:latest
# docker push                                       dpcrook/alpine-lighttpd-static:latest
```
