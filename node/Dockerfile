FROM skpr/base:1.x

RUN apk --update --no-cache add nodejs npm yarn bash make
RUN mkdir /data && chown skpr:skpr /data

WORKDIR /data

USER skpr
