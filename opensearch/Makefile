#!/usr/bin/make -f

REGISTRY=skpr/opensearch

build:
	docker build -t $(REGISTRY):1.x-dev dev

push:
	docker push $(REGISTRY):1.x-dev

.PHONY: *
