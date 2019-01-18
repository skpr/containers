FROM skpr/base:1.x

RUN apk --update --no-cache add nginx

ADD nginx.conf /etc/nginx/nginx.conf
ADD default.conf /etc/nginx/conf.d/default.conf
ADD status.conf /etc/nginx/conf.d/status.conf

VOLUME /run/nginx

EXPOSE 80

STOPSIGNAL SIGTERM

CMD ["nginx"]
