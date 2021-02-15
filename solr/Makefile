#!/usr/bin/make -f

REGISTRY=skpr/solr

build: validate build_init
	docker build --build-arg SOLR_IMAGE=${SOLR_IMAGE} --build-arg SEARCH_API_SOLR_VERSION=${SEARCH_API_SOLR_VERSION} -t $(REGISTRY):${SOLR_VERSION}-${SEARCH_API_SOLR_VERSION} .

push: validate push_init
	docker push $(REGISTRY):${SOLR_VERSION}-${SEARCH_API_SOLR_VERSION}

build_init:
	docker build -t $(REGISTRY):init init

push_init:
	docker push $(REGISTRY):init

validate:
ifndef SOLR_IMAGE
	$(error SOLR_IMAGE is undefined)
endif
ifndef SEARCH_API_SOLR_VERSION
	$(error SEARCH_API_SOLR_VERSION is undefined)
endif
ifndef SOLR_VERSION
	$(error SOLR_VERSION is undefined)
endif

.PHONY: *
