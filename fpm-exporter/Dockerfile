FROM alpine:3.8

ADD https://github.com/hipages/php-fpm_exporter/releases/download/v1.0.0/php-fpm_exporter_1.0.0_linux_amd64 /usr/local/bin/php-fpm_exporter
RUN chmod +x /usr/local/bin/php-fpm_exporter

CMD [ "php-fpm_exporter", "server" ]