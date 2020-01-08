#!/usr/bin/make -f

REGISTRY=skpr/base

build:
	docker build --no-cache -t $(REGISTRY):1.x .

push:
	docker push $(REGISTRY):1.x

.PHONY: *
