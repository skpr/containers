#!/usr/bin/make -f

REGISTRY=docker.pkg.github.com/skpr/containers/base

build:
	docker build -t $(REGISTRY):1.x .

push:
	docker push $(REGISTRY):1.x

.PHONY: *
