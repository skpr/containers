#!/usr/bin/make -f

REGISTRY=skpr/clamav

build:
	docker build -t $(REGISTRY):2.x .

push:
	docker push $(REGISTRY):2.x

.PHONY: *
