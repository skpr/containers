ARG PHP_VERSION=7.2
FROM skpr/php:${PHP_VERSION}-1.x
ARG PHP_VERSION=7.2

ENV PHP_MEMORY_LIMIT=256M

ENV PATH=$PATH:$EXTRA_PATH

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
    chmod +x /usr/local/bin/composer1

RUN curl -sS https://getcomposer.org/download/2.0.14/composer.phar -o /usr/local/bin/composer2 && \
    chmod +x /usr/local/bin/composer && \
    ln -sv usr/local/bin/composer2 usr/local/bin/composer

# A lightweight crond for local development environments. Also leveraged the Skpr Preview environments.
RUN curl -sSL https://github.com/skpr/crond/releases/download/v0.0.1/skpr-crond_0.0.1_linux_amd64.tar.gz -o /tmp/skpr-crond.tar.gz && \
    tar -zxvf /tmp/skpr-crond.tar.gz skpr-crond && \
    mv skpr-crond /usr/local/bin/skpr-crond && \
    rm -f /tmp/skpr-crond.tar.gz

ADD drush /etc/drush

USER skpr

CMD ["bash"]
