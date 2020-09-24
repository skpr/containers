ARG PHP_VERSION=7.2
FROM skpr/php-circleci:${PHP_VERSION}-1.x
ARG PHP_VERSION=7.2

USER root

COPY fpm/php-fpm.conf /etc/php/php-fpm.conf
COPY nginx/default.conf /etc/nginx/conf.d/default.conf

# Below are for packages such as https://www.npmjs.com/package/sharp
RUN apk --update --no-cache add ca-certificates \
  g++ \
  git \
  openssh-client \
  python2 \
  autoconf \
  automake \
  libpng-dev \
  libtool \
  nasm

USER skpr
