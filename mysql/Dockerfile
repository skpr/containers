FROM skpr/base:1.x

RUN apk add --no-cache bash mysql-client

ADD scripts/mysql-drop-tables.sh /usr/local/bin/mysql-drop-tables
RUN chmod +x /usr/local/bin/mysql-drop-tables

USER skpr
