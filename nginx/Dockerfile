FROM skpr/base:1.x

RUN apk --update --no-cache add nginx

ADD nginx.conf /etc/nginx/nginx.conf

ADD default.conf /etc/nginx/conf.d/default.conf
ADD status.conf /etc/nginx/conf.d/status.conf
ADD security.conf /etc/nginx/conf.d/security.conf
RUN touch /etc/nginx/conf.d/http.conf

# Configuration file used for overriding default.conf server configuration.
RUN mkdir -p /etc/nginx/overrides.d

# Configuration file used for managing redirects.
RUN touch /etc/nginx/redirects.conf

# We need to create and chown these directory for
# readonly and non-root execution.
RUN mkdir -p /run/nginx
RUN ln -sf /dev/stderr /var/log/nginx/error.log
RUN chown -R skpr:skpr /etc/nginx/overrides.d \
                       /var/lib/nginx \
                       /var/log/nginx \
                       /var/tmp/nginx \
                       /var/lib/nginx/logs \
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
