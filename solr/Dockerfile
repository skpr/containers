ARG SOLR_IMAGE=7.7-slim

FROM solr:${SOLR_IMAGE}
LABEL maintainer="admin@skpr.io"

ENV SOLR_CORE="drupal"

ENV SOLR_HEAP="256m"
ENV SOLR_JAVA_MEM="-Xms256m -Xmx256m"
ENV JVM_OPTS="-Xms256m -Xmx256m"
ENV MY_SOLR_OPTS="${MY_SOLR_OPTS:-} -Dlog4j2.formatMsgNoLookups=true"

ARG SEARCH_API_SOLR_VERSION
ARG SOLR_VERSION

COPY --chown=solr:solr search_api_solr/${SEARCH_API_SOLR_VERSION}/${SOLR_VERSION} /search_api

VOLUME /opt/solr/server/solr/mycores
VOLUME /opt/solr/server/logs
VOLUME /tmp

CMD ["/bin/bash", "-c", "solr-precreate ${SOLR_CORE} /search_api"]
