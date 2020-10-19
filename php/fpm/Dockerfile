ARG PHP_VERSION=7.2
FROM skpr/php:${PHP_VERSION}-1.x
ARG PHP_VERSION=7.2

RUN apk --update --no-cache add \
      php${PHP_VERSION}-fpm

COPY conf.d/50_fpm.ini /etc/php/conf.d/50_fpm.ini
COPY php-fpm.conf /etc/php/php-fpm.conf

# PHP 7.2 does not support "decorate_workers_output" config.
RUN if [ "$PHP_VERSION" == "7.2" ]; then sed -i '/^decorate_workers_output/d' /etc/php/php-fpm.conf; fi

EXPOSE 9000

USER skpr

# Configuration which can be overriden.
# See /etc/php/php-fpm.conf
ENV PHP_FPM_PORT=9000 \
    PHP_FPM_MAX_CHILDREN=20 \
    PHP_FPM_START_SERVERS=2 \
    PHP_FPM_MIN_SPARE_SERVERS=2 \
    PHP_FPM_MAX_SPARE_SERVERS=10 \
    PHP_FPM_MAX_REQUESTS=500 \
    PHP_FPM_REQUEST_TIMEOUT=60

CMD ["php-fpm", "-F"]
