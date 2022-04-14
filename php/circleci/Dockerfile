ARG NODE_VERSION=10-1.x
ARG PHP_VERSION=7.2
FROM skpr/node:${NODE_VERSION} as node

ARG PHP_VERSION=7.2
FROM skpr/php-cli:${PHP_VERSION}-1.x
ARG PHP_VERSION=7.2

USER root

RUN apk --update --no-cache add \
  php${PHP_VERSION}-fpm \
  openssh-client

COPY fpm/conf.d/50_fpm.ini /etc/php/conf.d/50_fpm.ini
COPY fpm/php-fpm.conf /etc/php/php-fpm.conf

# Configuration which can be overriden.
# See /etc/php/php-fpm.conf
ENV PHP_FPM_PORT=9000 \
    PHP_FPM_MAX_CHILDREN=20 \
    PHP_FPM_START_SERVERS=2 \
    PHP_FPM_MIN_SPARE_SERVERS=2 \
    PHP_FPM_MAX_SPARE_SERVERS=10 \
    PHP_FPM_MAX_REQUESTS=500

EXPOSE 9000

# Configuration duplicated from the Nginx Dockerfile.
RUN apk --update --no-cache add nginx

ADD nginx/nginx.conf /etc/nginx/nginx.conf
ADD nginx/default.conf /etc/nginx/conf.d/default.conf
ADD nginx/security.conf /etc/nginx/conf.d/security.conf
RUN touch /etc/nginx/conf.d/custom.conf
RUN touch /etc/nginx/redirects.conf

# Configuration file used for overriding default.conf server configuration.
RUN mkdir -p /etc/nginx/overrides.d

# Configuration duplicated from the Node Dockerfile.
RUN apk --update --no-cache add bash \
  make \
  zip \
  ca-certificates \
  g++ \
  git \
  openssh-client \
  # Below are for packages such as https://www.npmjs.com/package/sharp
  python2 \
  autoconf \
  automake \
  libpng-dev \
  libtool \
  nasm \
  vips-dev \
  chromium

COPY --chown=skpr:skpr --from=node /usr/local/lib/node_modules /usr/local/lib/node_modules
COPY --chown=skpr:skpr --from=node /usr/local/bin/node /usr/local/bin/node
COPY --chown=skpr:skpr --from=node /opt /opt
RUN ln -s /usr/local/lib/node_modules/npm/bin/npm-cli.js /usr/local/bin/npm && \
  ln -s /usr/local/lib/node_modules/npm/bin/npx-cli.js /usr/local/bin/npx && \
  ln -s `find /opt -name yarn|head -1` /usr/local/bin/yarn && \
  ln -s `find /opt -name yarnpkg|head -1` /usr/local/bin/yarnpkg && \
  node --version && \
  npm --version && \
  npx --version && \
  yarn --version && \
  yarnpkg --version

RUN apk --update --no-cache add ruby ruby-dev && \
    gem install -N bundler:2.0.2

# Install Github Hub
RUN curl -sSL http://bins.skpr.io/hub-latest -o /usr/local/bin/hub && \
  chmod +rx /usr/local/bin/hub

# Install Github CLI
RUN export GITHUB_CLI_VERSION=1.10.2 && \
    export GITHUB_CLI_DIST=gh_${GITHUB_CLI_VERSION}_linux_amd64 && \
    curl -sSL https://github.com/cli/cli/releases/download/v${GITHUB_CLI_VERSION}/${GITHUB_CLI_DIST}.tar.gz -o /tmp/${GITHUB_CLI_DIST}.tar.gz && \
    tar xf /tmp/${GITHUB_CLI_DIST}.tar.gz -C /tmp && \
    mv /tmp/${GITHUB_CLI_DIST}/bin/gh /usr/local/bin/ && \
    chmod +rx /usr/local/bin/gh

# Install PHP Local Security Checker
RUN curl -sSL https://github.com/fabpot/local-php-security-checker/releases/download/v1.0.0/local-php-security-checker_1.0.0_linux_amd64 -o /usr/local/bin/local-php-security-checker && \
  chmod +rx /usr/local/bin/local-php-security-checker

# We need to create and chown these directory for
# readonly and non-root execution.
RUN mkdir -p /run/nginx /var/tmp/nginx
RUN chown -R skpr:skpr /var/lib/nginx \
                       /var/log/nginx \
                       /var/tmp/nginx \
                       /var/lib/nginx/logs \
                       /usr/lib/nginx/modules \
                       /run/nginx \
                       /etc/nginx/overrides.d

# Allow edits to php/nginx conf in circle jobs
RUN chown :skpr /etc/nginx/conf.d/default.conf \
  /etc/php/php-fpm.conf
RUN chmod g+w /etc/nginx/conf.d/default.conf \
  /etc/php/php-fpm.conf

# Declaring these here means they inherit the "chown"
# directive from above.
VOLUME /run/nginx
VOLUME /var/tmp/nginx
VOLUME /var/lib/nginx/logs

EXPOSE 8080

STOPSIGNAL SIGTERM

USER skpr
