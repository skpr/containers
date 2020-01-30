ARG IMAGE=skpr/php:7.2-1.x
FROM ${IMAGE}

USER root

# https://blog.blackfire.io/alpine-linux-support.html
RUN PHP_VERISON=$(php -r "echo PHP_MAJOR_VERSION.PHP_MINOR_VERSION;") && \
    curl -sSL -A "Docker" -o /tmp/blackfire-probe.tar.gz -D - -L -s https://blackfire.io/api/v1/releases/probe/php/alpine/amd64/$PHP_VERISON && \
    mkdir -p /tmp/blackfire && \
    tar zxpf /tmp/blackfire-probe.tar.gz -C /tmp/blackfire && \
    mv /tmp/blackfire/blackfire-*.so $(php -r "echo ini_get('extension_dir');")/blackfire.so && \
    rm -rf /tmp/blackfire /tmp/blackfire-probe.tar.gz

COPY conf.d/01_blackfire.ini /etc/php/conf.d/01_blackfire.ini
COPY conf.d/50_dev.ini /etc/php/conf.d/50_dev.ini

USER skpr
