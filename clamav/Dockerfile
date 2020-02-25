FROM skpr/base:1.x

RUN apk add --no-cache clamav-daemon clamav-libunrar unrar
COPY clamd.conf /etc/clamav/clamd.conf

RUN mkdir -p /run/clamav /var/lib/clamav /var/log/clamav && \
    chown -R skpr:skpr /run/clamav /var/lib/clamav /var/log/clamav

VOLUME /run/clamav
VOLUME /var/lib/clamav
VOLUME /var/log/clamav

USER skpr

EXPOSE 3310

CMD ["clamd"]
