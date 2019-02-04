FROM alpine:3.8 as pull

RUN apk add curl

ENV EXPORTER_VERSION=0.2.0

RUN curl -L -O "https://github.com/nginxinc/nginx-prometheus-exporter/releases/download/v${EXPORTER_VERSION}/nginx-prometheus-exporter-${EXPORTER_VERSION}-linux-amd64.tar.gz" && \
      tar -zxvf nginx-prometheus-exporter-${EXPORTER_VERSION}-linux-amd64.tar.gz

FROM alpine:3.8

COPY --from=pull /nginx-prometheus-exporter /usr/local/bin/nginx-prometheus-exporter
RUN chmod +x /usr/local/bin/nginx-prometheus-exporter

CMD [ "nginx-prometheus-exporter" ]