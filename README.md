# lighttpd image, built on alpine

Intended to serve static pages, on a kubernetes cluster.

See [lighttpd](http://www.lighttpd.net/)


## Build and testing with docker


Build and run container in local docker

```
docker build -t dpcrook/alpine-lighttpd-static .
docker run --name "my-lighttpd" --rm  -P -t -d \
	-v `pwd`/static:/var/www/htdocs \
	dpcrook/alpine-lighttpd-static
```

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

## Using with kubernetes

There is a `static` directory here, that is intended to be mounted into container at `/var/www/htdocs`


## Docker Hub

``` shell
docker login
TAG_VERSION=0.1.0
docker build -t dpcrook/alpine-lighttpd-static:${TAG_VERSION} .
docker push dpcrook/alpine-lighttpd-static:${TAG_VERSION}
```
