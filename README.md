lighttpd image, built on alpine
===============================

Intended to serve static pages, on a kubernetes cluster.

See [lighttpd](http://www.lighttpd.net/)

-	https://hub.docker.com/r/dpcrook/alpine-lighttpd-static/

Using with kubernetes
---------------------

There is `./static` directory in repo as a placeholder. The static files to host are intended to be mounted into container at `/var/www/htdocs`

e.g. in your `spec.containers`:

```
 ...
        volumeMounts:
        - mountPath: /var/www/htdocs/
          name: lighttpd-persistent-storage
 ...
```

Docker Hub
==========

open https://hub.docker.com/r/dpcrook/alpine-lighttpd-static/tags

### Access the server and inspect the container.

If the `lighttpd` container is running, try to use it.

#### Open in browser

```shell
docker ps
# open http://0.0.0.0:32768   <- URL address/port comes from mapped PORTS
```

#### view logs

```shell
docker exec -it my-lighttpd /bin/sh -i
cat /var/log/lighttpd/error.log
tail -f /var/log/lighttpd/access.log
# <Ctrl-C>
exit
```

#### stop container

```shell
docker container stop "my-lighttpd"
```

### arm32v6 version

See `Dockerfile.arm64v6` for arm32v6 Dockerfile and building

### arm32v7 version

See `Dockerfile.arm64v7` for arm32v7 Dockerfile and building

### arm64 version

See `Dockerfile.arm64v8` for arm64 Dockerfile and `README.arm64v8.md` for building

-	https://hub.docker.com/r/dpcrook/alpine-lighttpd-static/ tagged with arm64v8
