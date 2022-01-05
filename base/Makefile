#!/usr/bin/make -f

REGISTRY=skpr/base
ALPINE_VERSION=3.14

build:
	docker build --build-arg ALPINE_VERSION=${ALPINE_VERSION} -t $(REGISTRY):1.x .

push:
	docker push $(REGISTRY):1.x

.PHONY: *
