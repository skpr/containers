#!/usr/bin/make -f

IMAGE=skpr/node

define buildimage
  docker build --build-arg ALPINE_VERSION=$(1) --build-arg NODE_VERSION=$(2) -t $(IMAGE):$(2)-$(3) .
endef

define pushimage
	docker push $(IMAGE):$(1)-$(2)
endef

build: build12 build14 build16 build18 build20

lint:
	hadolint Dockerfile

build12:
	$(call buildimage,3.12,12,1.x)

build14:
	$(call buildimage,3.13,14,1.x)

build16:
	$(call buildimage,3.14,16,1.x)

build18:
	$(call buildimage,3.14,18,1.x)

build20:
	$(call buildimage,3.14,20,1.x)

push: build
	$(call pushimage,12,1.x)
	$(call pushimage,14,1.x)
	$(call pushimage,16,1.x)
	$(call pushimage,18,1.x)
	$(call pushimage,20,1.x)

.PHONY: *
