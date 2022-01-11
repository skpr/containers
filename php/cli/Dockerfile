ARG IMAGE=skpr/php:7.2-1.x

FROM skpr/base:1.x as redis-cli
RUN apk add redis

FROM ${IMAGE}

ARG ARCH=amd64
ARG PHP_VERSION=7.2

ENV PHP_MEMORY_LIMIT=256M

ENV PATH=$PATH:$EXTRA_PATH

ENV PS1='\u@\h:\W \$ '

COPY --from=redis-cli /usr/bin/redis-cli /usr/bin/redis-cli

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

RUN curl -sS https://getcomposer.org/download/latest-1.x/composer.phar -o /usr/local/bin/composer1 && \
    chmod +x /usr/local/bin/composer1

RUN curl -sS https://getcomposer.org/download/latest-2.x/composer.phar -o /usr/local/bin/composer && \
    chmod +x /usr/local/bin/composer && \
    ln -sv /usr/local/bin/composer /usr/local/bin/composer2

# A lightweight crond for local development environments. Also leveraged the Skpr Preview environments.
RUN curl -sSL https://github.com/skpr/crond/releases/download/v0.0.2/skpr-crond_0.0.2_linux_${ARCH}.tar.gz -o /tmp/skpr-crond.tar.gz && \
    tar -zxvf /tmp/skpr-crond.tar.gz skpr-crond && \
    mv skpr-crond /usr/local/bin/skpr-crond && \
    rm -f /tmp/skpr-crond.tar.gz

ADD drush /etc/drush

USER skpr

CMD ["bash"]
