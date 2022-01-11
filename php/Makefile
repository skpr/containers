#!/usr/bin/make -f

REGISTRY=skpr/php
ARCH=amd64

COMMON_BUILD_ARGS=--build-arg=ARCH=$(ARCH) --build-arg PHP_VERSION=$(VERSION)

IMAGE_BASE=$(REGISTRY):$(VERSION)-1.x
IMAGE_FPM=$(REGISTRY)-fpm:$(VERSION)-1.x
IMAGE_CLI=$(REGISTRY)-cli:$(VERSION)-1.x

IMAGE_FPM_DEV=$(IMAGE_FPM)-dev
IMAGE_CLI_DEV=$(IMAGE_CLI)-dev

IMAGE_FPM_XDEBUG=$(IMAGE_FPM)-xdebug
IMAGE_CLI_XDEBUG=$(IMAGE_CLI)-xdebug

build: validate
	# Building production images.
	docker build --no-cache $(COMMON_BUILD_ARGS) -t $(IMAGE_BASE) base
	docker build --no-cache $(COMMON_BUILD_ARGS) --build-arg IMAGE=$(IMAGE_BASE) -t $(IMAGE_FPM) fpm
	docker build --no-cache $(COMMON_BUILD_ARGS) --build-arg IMAGE=$(IMAGE_BASE) -t $(IMAGE_CLI) cli
	
	# Testing production images.
	container-structure-test test --image $(IMAGE_BASE) --config base/tests.yml
	container-structure-test test --image $(IMAGE_FPM) --config fpm/tests.yml
	container-structure-test test --image $(IMAGE_CLI) --config cli/tests.yml
	
	# Building dev images.
	docker build --no-cache $(COMMON_BUILD_ARGS) --build-arg IMAGE=$(IMAGE_FPM) -t $(IMAGE_FPM)-dev dev
	docker build --no-cache $(COMMON_BUILD_ARGS) --build-arg IMAGE=$(IMAGE_CLI) -t $(IMAGE_CLI)-dev dev
	
	# Building Xdebug images.
	docker build --no-cache $(COMMON_BUILD_ARGS) --build-arg IMAGE=$(IMAGE_FPM_DEV) -t $(IMAGE_FPM_XDEBUG) xdebug
	docker build --no-cache $(COMMON_BUILD_ARGS) --build-arg IMAGE=$(IMAGE_CLI_DEV) -t $(IMAGE_CLI_XDEBUG) xdebug
	
	# Building CircleCI images.
	docker build --no-cache $(COMMON_BUILD_ARGS) --build-arg NODE_VERSION=10 -t $(REGISTRY)-circleci:$(VERSION)-1.x circleci
	# 1.x version is Node 10, 2.x is Node 14.
	docker build --no-cache $(COMMON_BUILD_ARGS) --build-arg NODE_VERSION=14 -t $(REGISTRY)-circleci:$(VERSION)-2.x circleci

push: validate
	# Pushing production images
	docker push $(IMAGE_BASE)
	docker push $(IMAGE_FPM)
	docker push $(IMAGE_CLI)

	# Pushing dev images.
	docker push $(IMAGE_FPM_DEV)
	docker push $(IMAGE_CLI_DEV)

	# Pushing Xdebug images.
	docker push $(IMAGE_FPM_XDEBUG)
	docker push $(IMAGE_CLI_XDEBUG)

	# Pushing CircleCI images.
	docker push $(REGISTRY)-circleci:$(VERSION)-1.x
	docker push $(REGISTRY)-circleci:$(VERSION)-2.x

manifest:


validate:
ifndef VERSION
	$(error VERSION is undefined)
endif

.PHONY: *

skpr/php-cli:7.4-1.x-xdebug