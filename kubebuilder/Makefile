#!/usr/bin/make -f

REGISTRY=skpr/kubebuilder

build:
	docker build -t $(REGISTRY):v2 v2

push:
	docker push $(REGISTRY):v2

.PHONY: *
