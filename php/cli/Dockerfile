ARG PHP_VERSION=7.2
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

RUN curl -sS https://getcomposer.org/composer-1.phar -o /usr/local/bin/composer && \
    chmod +x /usr/local/bin/composer

RUN curl -sS https://getcomposer.org/composer-2.phar -o /usr/local/bin/composer2 && \
    chmod +x /usr/local/bin/composer2

ADD drush /etc/drush

USER skpr

CMD ["bash"]
