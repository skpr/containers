#!/usr/bin/make -f

IMAGE=skpr/node

define buildimage
  docker build --build-arg NODE_VERSION=$(1) -t $(IMAGE):$(1)-$(2) .
endef

define push
	docker push $(IMAGE):$(1)-$(2)
endef

build: build10 build12 build14

lint:
	hadolint Dockerfile

build10:
	$(call buildimage,10,1.x)

build12:
	$(call buildimage,12,1.x)

build14:
	$(call buildimage,14,1.x)

release: build
	$(call push,10,1.x)
	$(call push,12,1.x)
	$(call push,14,1.x)

.PHONY: *
