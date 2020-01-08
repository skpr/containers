FROM alpine:3.10

ENV ALPINE_VERSION=3.10

RUN apk add util-linux git gcc make

RUN git clone https://github.com/nickschuch/musl.git && \
    cd musl && \
    ./configure && make && make install

RUN adduser -D -u 1000 skpr
