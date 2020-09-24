ARG PHP_VERSION=7.2
FROM skpr/php-circleci:${PHP_VERSION}-1.x
ARG PHP_VERSION=7.2

USER root

RUN sed -i 's/\/data\/app/\/data\/api\/app/g' /etc/nginx/conf.d/default.conf
RUN sed -i 's/\/data\/app/\/data\/api\/app/g' /etc/php/php-fpm.conf

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
