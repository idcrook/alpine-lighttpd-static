<!--- -*- markdown -*- --->

Build arm64v8 version
=====================

```shell
TAG_VERSION=0.1.16-arm64v8
sudo docker build --no-cache -t alpine-lighttpd-static:${TAG_VERSION} -f Dockerfile.arm64v8 .
sudo docker run --name "my-lighttpd" --rm  -P -t -d \
	-v `pwd`/static:/var/www/htdocs \
	alpine-lighttpd-static:${TAG_VERSION}
sudo docker exec -it my-lighttpd /bin/sh -i
# grep ^ /var/log/lighttpd/*.log
# ls -l /var/lib/lighttpd/cache/deflate/
# exit
# sudo docker ps
# curl  0.0.0.0:49154  # get actual port from previous command output
# curl -6 [::]:49153
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
