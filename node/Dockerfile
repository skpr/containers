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
  util-linux

# Install latest version of libvips from source.
# Gatsby 3 requires sharp 0.27.0 or higher.
# sharp requires libvips 8.10.5 or higher.
# Only Alpine 3.13 has libvips 8.10+ available via apk.
RUN apk --update --no-cache add glib-dev \
  expat-dev \
  jpeg-dev
RUN cd /tmp && \
  wget https://github.com/libvips/libvips/releases/download/v8.10.6/vips-8.10.6.tar.gz
RUN cd /tmp && \
  tar -xzvf vips-8.10.6.tar.gz
RUN cd /tmp/vips-8.10.6 && \
  ./configure
RUN cd /tmp/vips-8.10.6 && \
 make
RUN cd /tmp/vips-8.10.6 && \
  make install
RUN rm -rf /tmp/vips-8.10.6

RUN deluser node
RUN adduser -D -u 1000 skpr
RUN mkdir /data && chown skpr:skpr /data

WORKDIR /data

USER skpr

ENV PATH /data/node_modules/.bin:$PATH
