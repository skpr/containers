ARG NODE_VERSION=10
ARG ALPINE_VERSION=3.10
FROM node:${NODE_VERSION}-alpine${ALPINE_VERSION}

RUN apk add --no-cache \
  bash \
  ca-certificates \
  g++ \
  git \
  make \
  openssh-client \
  python2 \
  # Below are for packages such as https://www.npmjs.com/package/imagemin
  autoconf \
  automake \
  libpng-dev \
  libtool \
  nasm \
  util-linux \
  glib-dev \
  expat-dev \
  jpeg-dev

RUN mkdir -p /usr/local/lib
ADD binaries/lib-vips-8.10.6-linuxmusl-x64.tar.gz /usr/local/lib

RUN deluser node
RUN adduser -D -u 1000 skpr
RUN mkdir /data && chown skpr:skpr /data

WORKDIR /data

USER skpr

ENV PATH /data/node_modules/.bin:$PATH
