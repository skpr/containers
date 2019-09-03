#!/usr/bin/make -f

REGISTRY=docker.pkg.github.com/skpr/containers/solr

build:
	docker build -t $(REGISTRY):init init
	docker build --build-arg SOLR_VERSION=7.7-slim --build-arg SEARCH_API_SOLR_VERSION=3.x -t $(REGISTRY):7.x-3.x 7.x

push:
	docker push $(REGISTRY):init
	docker push $(REGISTRY):7.x-3.x

.PHONY: *
