#!/usr/bin/make -f

REGISTRY=docker.pkg.github.com/skpr/containers/node

build:
	docker build -t $(REGISTRY):10-1.x .

push:
	docker push $(REGISTRY):10-1.x

.PHONY: *
