FROM  solr:7
LABEL maintainer="security@skpr.io"

ENV SOLR_HEAP="256m"
ENV SOLR_CORE="core1"

COPY --chown=solr:solr conf /opt/search_api
COPY --chown=solr:solr scripts/core.sh /docker-entrypoint-initdb.d/set-core.sh

VOLUME /opt/solr/server/solr/mycores
