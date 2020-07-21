ARG NODE_VERSION=10
FROM node:${NODE_VERSION}-alpine

RUN apk add --no-cache ca-certificates bash make git

RUN deluser node
RUN adduser -D -u 1000 skpr
RUN mkdir /data && chown skpr:skpr /data

WORKDIR /data

USER skpr
