#!/usr/bin/make -f

REGISTRY=skpr/node

build:
	docker build -t $(REGISTRY):10-1.x .

push:
	docker push $(REGISTRY):10-1.x

.PHONY: *
