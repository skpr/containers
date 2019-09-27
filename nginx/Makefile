#!/usr/bin/make -f

REGISTRY=skpr/nginx

build:
	docker build -t $(REGISTRY):1.x .
	docker build -t $(REGISTRY):1.x-dev dev

push:
	docker push $(REGISTRY):1.x
	docker push $(REGISTRY):1.x-dev

.PHONY: *
