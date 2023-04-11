#!/usr/bin/make -f

REGISTRY=skpr/clamav

build:
	docker build -t $(REGISTRY):2.1.x .

push:
	docker push $(REGISTRY):2.1.x

.PHONY: *
