ARG IMAGE=skpr/php:7.2-1.x
FROM ${IMAGE}

ARG PHP_VERSION=7.2

USER root
RUN apk add php${PHP_VERSION}-xdebug
USER skpr

COPY conf.d/01_xdebug.ini /etc/php/conf.d/01_xdebug.ini
