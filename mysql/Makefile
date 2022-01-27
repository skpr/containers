#!/usr/bin/make -f

REGISTRY=docker.io/skpr/mysql

build:
	$(call buildimage,drop-tables)
	# @todo, The drop-tables image will be emancipated from the base image in a future release.
	docker tag $(REGISTRY)-drop-tables:1.x $(REGISTRY):1.x
	$(call buildimage,import)

push:
	$(call pushimage,drop-tables)
    $(call pushimage,import)
	# @todo, The drop-tables image will be emancipated from the base image in a future release.
    docker push $(REGISTRY):1.x

define buildimage
	DOCKER_BUILDKIT=1 docker build -t $(REGISTRY)-$(1):1.x $(1)
endef

define pushimage
	docker push $(REGISTRY)-$(1):1.x
endef

.PHONY: *
