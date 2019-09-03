#!/usr/bin/make -f

REGISTRY=docker.pkg.github.com/skpr/containers/kubebuilder

build:
	docker build -t $(REGISTRY):v1.0.6 .

push:
	docker push $(REGISTRY):v1.0.6

.PHONY: *
