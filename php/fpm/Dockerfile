ARG PHP_VERSION=7.2
FROM skpr/php:${PHP_VERSION}-1.x

RUN apk --update --no-cache add \
      php${PHP_VERSION}-fpm

COPY php.ini /etc/php7/conf.d/50-setting.ini
COPY php-fpm.conf /etc/php7/php-fpm.conf

EXPOSE 9000

CMD ["php-fpm7", "-F"]
