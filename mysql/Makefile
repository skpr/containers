#!/usr/bin/make -f

REGISTRY=skpr/mysql

build:
	docker build -t $(REGISTRY):1.x .

push:
	docker push $(REGISTRY):1.x

.PHONY: *
