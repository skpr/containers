#!/usr/bin/make -f

REGISTRY=skpr/kubebuilder

build:
	docker build -t $(REGISTRY):v1.0.6 .

push:
	docker push $(REGISTRY):v1.0.6

.PHONY: *
