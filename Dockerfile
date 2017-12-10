FROM  php:7.0-alpine

LABEL maintainer Adam Github.com/GEM7/filerun-docker


RUN  buildDeps="curl unzip logrotate" && \
        set -x &&\
	mkdir -p $WEB_DIR && \
	mkdir -p $WEB_DIR$FILE_PATH	&& \
        mkdir -p $CERT_DIR && \
        mkdir -p /tmp/caddy && \
        apk add --no-cache $buildDeps ca-certificates && \
        curl -sl -o /tmp/caddy/caddy_linux_amd64.tar.gz $CADDY_DL && \
        tar -zxf /tmp/caddy/caddy_linux_amd64.tar.gz -C /tmp/caddy && \
        mv /tmp/caddy/caddy /usr/bin/ && \
        chmod +x /usr/bin/caddy && \
	chmod +x /usr/local/bin/entrypoint.sh && \
        rm -rf /tmp/caddy && \
        apk del --purge $buildDeps
