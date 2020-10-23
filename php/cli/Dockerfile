ARG PHP_VERSION=7.2

# We use a multi-stage build to ensure we don't install any additional
# software eg. redis-server.
# https://pkgs.alpinelinux.org/contents?branch=v3.10&name=redis&arch=x86_64&repo=main
FROM skpr/php:${PHP_VERSION}-1.x as redis-cli
RUN apk add redis

FROM skpr/php:${PHP_VERSION}-1.x
ARG PHP_VERSION=7.2

ENV PHP_MEMORY_LIMIT=256M

ENV PS1='\u@\h:\W \$ '

RUN apk --update --no-cache add \
      make \
      bash \
      curl \
      rsync \
      vim \
      openssh-client \
      patch \
      git \
      jq

COPY --from=redis-cli /usr/bin/redis-cli /usr/bin/redis-cli

RUN curl -sS https://getcomposer.org/installer | php && \
    mv composer.phar /usr/local/bin/composer && \
    chmod +x /usr/local/bin/composer

ADD drush /etc/drush

USER skpr

CMD ["bash"]
