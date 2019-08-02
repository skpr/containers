ARG IMAGE=skpr/php:7.2-1.x
FROM ${IMAGE}

ARG PHP_VERSION=7.2

USER root
RUN apk add php${PHP_VERSION}-xdebug
USER skpr

COPY dev.ini /etc/php7/conf.d/dev.ini
COPY xdebug.ini /etc/php7/conf.d/xdebug.ini