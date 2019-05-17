ARG PHP_VERSION=7.2
FROM skpr/php:${PHP_VERSION}-1.x
ARG PHP_VERSION=7.2

ENV PS1='\u@\h:\W \$ '

RUN apk --update --no-cache add \
      make \
      bash \
      curl \
      rsync \
      vim \
      patch \
      git

RUN curl -sS https://getcomposer.org/installer | php && \
    mv composer.phar /usr/local/bin/composer && \
    chmod +x /usr/local/bin/composer

USER skpr

CMD ["bash"]
