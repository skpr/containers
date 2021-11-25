FROM skpr/base:1.x

ARG PHP_VERSION=7.2

ENV NEW_RELIC_ENABLED=false
# ENV NEW_RELIC_APP_NAME=My Application
# ENV NEW_RELIC_LICENSE_KEY=xxxxxxxxxxxxxxxxx

ENV PHP_MEMORY_LIMIT=128M

ENV PHP_LOG_LIMIT=4096

ENV SYSLOG_SYMLINK=/mnt/syslog/log

ENV PATH "$PATH:/data/bin"

ENV LD_PRELOAD "/usr/lib/preloadable_libiconv.so php"

# https://github.com/moby/moby/issues/20295
RUN mkdir /data && \
    chown -R skpr:skpr /data

WORKDIR /data

RUN apk add --no-cache curl gnu-libiconv && \
    curl -sSL https://packages.skpr.io/php-alpine/skpr.rsa.pub -o /etc/apk/keys/skpr.rsa.pub && \
    echo "https://packages.skpr.io/php-alpine/${ALPINE_VERSION}/php${PHP_VERSION}" >> /etc/apk/repositories

RUN apk --update --no-cache add \
      php${PHP_VERSION} \
      php${PHP_VERSION}-apcu \
      php${PHP_VERSION}-bcmath \
      php${PHP_VERSION}-ctype \
      php${PHP_VERSION}-curl \
      php${PHP_VERSION}-dom \
      php${PHP_VERSION}-ftp \
      php${PHP_VERSION}-fileinfo \
      php${PHP_VERSION}-gd \
      php${PHP_VERSION}-iconv \
      php${PHP_VERSION}-mbstring \
      php${PHP_VERSION}-opcache \
      php${PHP_VERSION}-openssl \
      php${PHP_VERSION}-pcntl \
      php${PHP_VERSION}-pdo \
      php${PHP_VERSION}-pdo_mysql \
      php${PHP_VERSION}-pdo_sqlite \
      php${PHP_VERSION}-phar \
      php${PHP_VERSION}-posix \
      php${PHP_VERSION}-redis \
      php${PHP_VERSION}-session \
      php${PHP_VERSION}-simplexml \
      php${PHP_VERSION}-soap \
      php${PHP_VERSION}-sockets \
      php${PHP_VERSION}-sodium \
      php${PHP_VERSION}-sqlite3 \
      php${PHP_VERSION}-tokenizer \
      php${PHP_VERSION}-xml \
      php${PHP_VERSION}-xmlreader \
      php${PHP_VERSION}-xmlwriter \
      php${PHP_VERSION}-zlib \
      php${PHP_VERSION}-zip \
      pngquant \
      jpegoptim \
      mysql-client \
      optipng \
      tesseract-ocr \
      tesseract-ocr-dev \
      poppler-utils \
      libsodium

# https://php.watch/versions/8.0/ext-json
RUN if [[ "$PHP_VERSION" != "8.0" && "$PHP_VERSION" != "8.1" ]]; then \
    apk --update --no-cache add php${PHP_VERSION}-json; \
fi

# @todo, Remove once 7.3 is depreciated.
RUN if [ "$PHP_VERSION" == "7.3" ]; then \
    mv /etc/php/${PHP_VERSION}/* /etc/php/ && \
    rm -fR /etc/php/${PHP_VERSION} && \
    ln -sf /etc/php /etc/php/${PHP_VERSION} && \
    ln -sf /etc/php /etc/php7; \
fi

# New Relic - https://docs.newrelic.com/docs/release-notes/agent-release-notes/php-release-notes

RUN if [[ "$PHP_VERSION" != "8.1" ]]; then \
    export NR_INSTALL_SILENT=true && \
    export NR_INSTALL_USE_CP_NOT_LN=true && \
    export NR_VERSION=9.18.1.303 && \
    export NR_FILENAME=newrelic-php5-${NR_VERSION}-linux-musl && \
    curl -sSL https://download.newrelic.com/php_agent/archive/${NR_VERSION}/${NR_FILENAME}.tar.gz | gzip -dc | tar xf - && \
    cd ${NR_FILENAME} && ./newrelic-install install && \
    rm -fR /data/${NR_FILENAME} && \
    rm -f /etc/php/conf.d/newrelic.ini; \
fi

RUN curl -sSL https://github.com/skpr/mail/releases/download/v0.0.6/skprmail_linux_amd64 -o /usr/local/bin/skprmail && \
    chmod +rx /usr/local/bin/skprmail

# Built using an updated build approach in this fork: https://github.com/skpr/docconv
RUN curl -sSL https://s3.amazonaws.com/pnx-bins/docconv-d9ea05fbd50ab02d7a1d23af7ecb11d37c3b68be-${ALPINE_VERSION} -o /usr/local/bin/docconv && \
    chmod +rx /usr/local/bin/docconv

ADD conf.d/01_apcu.ini /etc/php/conf.d/01_apcu.ini
ADD conf.d/50_overrides.ini /etc/php/conf.d/50_overrides.ini
ADD conf.d/01_newrelic.ini /etc/php/conf.d/01_newrelic.ini

RUN if [[ "$PHP_VERSION" != "8.1" ]]; then \
    rm /etc/php/conf.d/01_newrelic.ini; \
fi

# Drush uses /tmp.
VOLUME /tmp
