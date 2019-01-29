FROM arm32v6/alpine
LABEL maintainer="Tommy CHOISY"

RUN apk -U upgrade && apk add openssl

ENV VERSION 0.7.4
ENV DOWNLOAD_URL https://github.com/jwilder/docker-gen/releases/download/$VERSION/docker-gen-alpine-linux-armhf-$VERSION.tar.gz
ENV DOCKER_HOST unix:///tmp/docker.sock

RUN wget -qO- $DOWNLOAD_URL | tar xvz -C /usr/local/bin

ENTRYPOINT ["/usr/local/bin/docker-gen"]
