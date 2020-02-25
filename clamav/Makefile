#!/usr/bin/make -f

REGISTRY=skpr/clamav

build:
	docker build -t $(REGISTRY):1.x .

push:
	docker push $(REGISTRY):1.x

.PHONY: *