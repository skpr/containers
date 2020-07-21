ARG NODE_VERSION=10
ARG ALPINE_VERSION=3.10
FROM node:${NODE_VERSION}-alpine${ALPINE_VERSION}

RUN apk add --no-cache ca-certificates bash make git python2

RUN deluser node
RUN adduser -D -u 1000 skpr
RUN mkdir /data && chown skpr:skpr /data

WORKDIR /data

USER skpr
