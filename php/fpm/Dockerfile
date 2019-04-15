ARG PHP_VERSION=7.2
FROM skpr/php:${PHP_VERSION}-1.x
ARG PHP_VERSION=7.2

RUN apk --update --no-cache add \
      php${PHP_VERSION}-fpm

COPY 50-setting.ini /etc/php7/conf.d/50-setting.ini
COPY php-fpm.conf /etc/php7/php-fpm.conf

EXPOSE 9000

USER skpr

CMD ["php-fpm", "-F"]
