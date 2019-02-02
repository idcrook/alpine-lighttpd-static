# lighttpd image, built on alpine

Intended to serve static pages, on a kubernetes cluster.

See [lighttpd](http://www.lighttpd.net/)

 - https://hub.docker.com/r/dpcrook/alpine-lighttpd-static/


## Using with kubernetes

There is `./static` directory in repo as a placeholder.  The static files to host are intended to be mounted into container at `/var/www/htdocs`

e.g. in your `spec.containers`:

```
 ...
        volumeMounts:
        - mountPath: /var/www/htdocs/
          name: lighttpd-persistent-storage
 ...
```


# Docker Hub


## arm32v6 version

Alpine Linux does not currently maintain a separate arm32v7 version.

```
TAG_VERSION=0.1.4
docker build --no-cache -t alpine-lighttpd-static-arm32v6:${TAG_VERSION} -f Dockerfile.arm32v6 .
docker run --name "my-lighttpd" --rm  -P -t -d \
	-v `pwd`/static:/var/www/htdocs \
	alpine-lighttpd-static-arm32v6:${TAG_VERSION}
docker exec -it my-lighttpd /bin/sh -i
cat /var/log/lighttpd/error.log
exit
docker stop <CONTAINER_ID>

docker tag  alpine-lighttpd-static-arm32v6:${TAG_VERSION} dpcrook/alpine-lighttpd-static:${TAG_VERSION}-arm32v6
docker push                                               dpcrook/alpine-lighttpd-static:${TAG_VERSION}-arm32v6
docker tag  alpine-lighttpd-static-arm32v6:${TAG_VERSION} dpcrook/alpine-lighttpd-static:latest
docker tag  alpine-lighttpd-static-arm32v6:${TAG_VERSION} dpcrook/alpine-lighttpd-static:arm32v6
docker push                                               dpcrook/alpine-lighttpd-static:latest
docker push                                               dpcrook/alpine-lighttpd-static:arm32v6
```

open  https://hub.docker.com/r/dpcrook/alpine-lighttpd-static/tags


### Access the server and  inspect the container.

If the `lighttpd` container is running, try to use it.

#### Open in browser

``` shell
docker ps
# open http://0.0.0.0:32768   <- URL address/port comes from mapped PORTS
```

#### view logs

``` shell
docker exec -it my-lighttpd /bin/sh -i
cat /var/log/lighttpd/error.log
tail -f /var/log/lighttpd/access.log
# <Ctrl-C>
exit
```

#### stop container

``` shell
docker container stop "my-lighttpd"
```


### arm64 version

See `Dockerfile.arm64` for arm64 Dockerfile and building

 - https://hub.docker.com/r/dpcrook/alpine-lighttpd-static-arm64/
