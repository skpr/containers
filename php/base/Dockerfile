FROM skpr/base:1.x

ARG PHP_VERSION=7.2

ENV NEW_RELIC_ENABLED=false
# ENV NEW_RELIC_APP_NAME=My Application
# ENV NEW_RELIC_LICENSE_KEY=xxxxxxxxxxxxxxxxx

ENV PHP_MEMORY_LIMIT=128M

ENV PATH "$PATH:/data/bin"

# https://github.com/moby/moby/issues/20295
RUN mkdir /data && \
    chown -R skpr:skpr /data

WORKDIR /data

RUN apk add --no-cache curl ca-certificates && \
    curl -L https://packages.skpr.io/php-alpine/skpr.rsa.pub -o /etc/apk/keys/skpr.rsa.pub && \
    echo "https://packages.skpr.io/php-alpine/${ALPINE_VERSION}/php${PHP_VERSION}" >> /etc/apk/repositories

RUN apk --update --no-cache add \
      php${PHP_VERSION}-apcu \
      php${PHP_VERSION}-bcmath \
      php${PHP_VERSION}-ctype \
      php${PHP_VERSION}-curl \
      php${PHP_VERSION}-dom \
      php${PHP_VERSION}-ftp \
      php${PHP_VERSION}-fileinfo \
      php${PHP_VERSION}-gd \
      php${PHP_VERSION}-iconv \
      php${PHP_VERSION}-json \
      php${PHP_VERSION}-mbstring \
      php${PHP_VERSION}-opcache \
      php${PHP_VERSION}-openssl \
      php${PHP_VERSION}-pcntl \
      php${PHP_VERSION}-pdo \
      php${PHP_VERSION}-pdo_mysql \
      php${PHP_VERSION}-pdo_sqlite \
      php${PHP_VERSION}-phar \
      php${PHP_VERSION}-posix \
      php${PHP_VERSION}-session \
      php${PHP_VERSION}-simplexml \
      php${PHP_VERSION}-soap \
      php${PHP_VERSION}-sqlite3 \
      php${PHP_VERSION}-tokenizer \
      php${PHP_VERSION}-xdebug \
      php${PHP_VERSION}-xml \
      php${PHP_VERSION}-xmlreader \
      php${PHP_VERSION}-xmlwriter \
      php${PHP_VERSION}-zip \
      pngquant \
      jpegoptim \
      mysql-client \
      optipng

# Libsodium is only avaiable in PHP versions > 7.1
# @todo, Remove once 7.1 is EOL.
RUN if [ "$PHP_VERSION" != "7.1" ]; then apk add php${PHP_VERSION}-sodium libsodium; fi

# This provides a compatibility layer for developer who are adding
# custom php.ini files to their projects.
# Bumping PHP versions should not result in changes to their Dockerfiles.
RUN ln -sf /etc/php/${PHP_VERSION} /etc/php7

# We don't want xdebug on by default.
RUN rm -f /etc/php7/conf.d/xdebug.ini

# New Relic
RUN export NR_INSTALL_SILENT=true && \
    export NR_INSTALL_USE_CP_NOT_LN=true && \
    export NR_VERSION=8.7.0.242 && \
    export NR_FILENAME=newrelic-php5-${NR_VERSION}-linux-musl && \
    curl -sSL https://download.newrelic.com/php_agent/archive/${NR_VERSION}/${NR_FILENAME}.tar.gz | gzip -dc | tar xf - && \
    cd ${NR_FILENAME} && ./newrelic-install install && \
    rm -fR /data/${NR_FILENAME}

ADD apcu.ini /etc/php7/conf.d/apcu.ini
ADD newrelic.ini /etc/php7/conf.d/newrelic.ini
ADD overrides.ini /etc/php7/conf.d/overrides.ini

# Drush uses /tmp.
VOLUME /tmp
