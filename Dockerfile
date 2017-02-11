FROM alpine:latest
MAINTAINER <idcrook@users.noreply.github.com>

RUN apk add --no-cache --update \
	lighttpd \
	lighttpd-mod_auth \
  && rm -rf /var/cache/apk/*

# copy config files
COPY etc/lighttpd/* /etc/lighttpd/

EXPOSE 80

# this is where files get served from. mount externally
VOLUME /var/www

ENTRYPOINT ["lighttpd", "-D", "-f", "/etc/lighttpd/lighttpd.conf"]
