FROM skpr/base:1.x

RUN apk add --no-cache clamav-daemon clamav-libunrar unrar
COPY clamd.conf /etc/clamav/clamd.conf
EXPOSE 3310
CMD ["clamd", "--foreground"]
