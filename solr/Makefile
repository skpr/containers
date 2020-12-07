#!/usr/bin/make -f

REGISTRY=skpr/solr

define build_image
	docker build --build-arg SOLR_VERSION=${1} --build-arg SEARCH_API_SOLR_VERSION=${2} -t $(REGISTRY):${3}-${2} ${3}
endef

define push_image:
	docker push $(REGISTRY):7.x-3.x
endef

build_init:
	docker build -t $(REGISTRY):init init

push_init:
	docker push $(REGISTRY):init

build: build_init
	$(call build_image,7.7-slim,3.x,7.x)
	$(call build_image,5.5-slim,1.x,5.x)

push: push_init
	$(call push_image,7.7-slim,3.x,7.x)
	$(call push_image,5.5-slim,1.x,5.x)

.PHONY: *
