FROM skpr/base:1.x

RUN apk --update --no-cache add nginx

ADD nginx.conf /etc/nginx/nginx.conf
ADD default.conf /etc/nginx/conf.d/default.conf
ADD status.conf /etc/nginx/conf.d/status.conf
ADD security.conf /etc/nginx/conf.d/security.conf
RUN touch /etc/nginx/conf.d/custom.conf
RUN touch /etc/nginx/redirects.conf

# We need to create and chown these directory for
# readonly and non-root execution.
RUN mkdir -p /run/nginx
RUN chown -R skpr:skpr /var/lib/nginx \
                       /var/log/nginx \
                       /var/tmp/nginx \
                       /usr/lib/nginx/modules \
                       /run/nginx

# Declaring these here means they inherit the "chown"
# directive from above.
VOLUME /run/nginx
VOLUME /var/tmp/nginx

EXPOSE 8080

STOPSIGNAL SIGTERM

USER skpr

CMD ["nginx"]
