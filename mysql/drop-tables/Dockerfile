FROM skpr/base:1.x

USER root

RUN apk add --no-cache bash mysql-client

ADD entrypoint.sh /usr/local/bin/entrypoint
RUN chmod +x /usr/local/bin/entrypoint

USER skpr

ENTRYPOINT ["/usr/local/bin/entrypoint"]
