#!/usr/bin/make -f

REGISTRY=skpr/php

define build_image
	# Building production images.
	docker build --build-arg PHP_VERSION=${1} -t $(REGISTRY):${1}-1.x base
	docker build --build-arg PHP_VERSION=${1} -t $(REGISTRY)-fpm:${1}-1.x fpm
	docker build --build-arg PHP_VERSION=${1} -t $(REGISTRY)-cli:${1}-1.x cli

	# Building dev images.
	docker build --build-arg PHP_VERSION=${1} --build-arg IMAGE=$(REGISTRY)-fpm:${1}-1.x -t $(REGISTRY)-fpm:${1}-1.x-dev dev
	docker build --build-arg PHP_VERSION=${1} --build-arg IMAGE=$(REGISTRY)-cli:${1}-1.x -t $(REGISTRY)-cli:${1}-1.x-dev dev

	# Building Xdebug images.
	docker build --build-arg PHP_VERSION=${1} --build-arg IMAGE=$(REGISTRY)-fpm:${1}-1.x-dev -t $(REGISTRY)-fpm:${1}-1.x-xdebug xdebug
	docker build --build-arg PHP_VERSION=${1} --build-arg IMAGE=$(REGISTRY)-cli:${1}-1.x-dev -t $(REGISTRY)-cli:${1}-1.x-xdebug xdebug
endef

define push_image
	# Pushing production images.
	docker push $(REGISTRY):${1}-1.x
	docker push $(REGISTRY)-fpm:${1}-1.x
	docker push $(REGISTRY)-cli:${1}-1.x

	# Pushing dev images.
	docker push $(REGISTRY)-fpm:${1}-1.x-dev
	docker push $(REGISTRY)-cli:${1}-1.x-dev

	# Pushing Xdebug images.
	docker push $(REGISTRY)-fpm:${1}-1.x-xdebug
	docker push $(REGISTRY)-cli:${1}-1.x-xdebug
endef

build:
	$(call build_image,7.2)
	$(call build_image,7.3)

push:
	$(call push_image,7.2)
	$(call push_image,7.3)

.PHONY: *
