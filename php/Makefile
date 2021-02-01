#!/usr/bin/make -f

REGISTRY=skpr/php
NODE_VERSION=10-1.x

build:
	# Building production images.
	docker build --no-cache --build-arg PHP_VERSION=$(PHP_VERSION) -t $(REGISTRY):$(PHP_VERSION)-1.x base
	docker build --no-cache --build-arg PHP_VERSION=$(PHP_VERSION) -t $(REGISTRY)-fpm:$(PHP_VERSION)-1.x fpm
	docker build --no-cache --build-arg PHP_VERSION=$(PHP_VERSION) -t $(REGISTRY)-cli:$(PHP_VERSION)-1.x cli
	
	# Testing production images.
	container-structure-test test --image $(REGISTRY)-fpm:$(PHP_VERSION)-1.x --config fpm/tests.yml
	
	# Building dev images.
	docker build --no-cache --build-arg PHP_VERSION=$(PHP_VERSION) --build-arg IMAGE=$(REGISTRY)-fpm:$(PHP_VERSION)-1.x -t $(REGISTRY)-fpm:$(PHP_VERSION)-1.x-dev dev
	docker build --no-cache --build-arg PHP_VERSION=$(PHP_VERSION) --build-arg IMAGE=$(REGISTRY)-cli:$(PHP_VERSION)-1.x -t $(REGISTRY)-cli:$(PHP_VERSION)-1.x-dev dev
	
	# Building Xdebug images.
	docker build --no-cache --build-arg PHP_VERSION=$(PHP_VERSION) --build-arg IMAGE=$(REGISTRY)-fpm:$(PHP_VERSION)-1.x-dev -t $(REGISTRY)-fpm:$(PHP_VERSION)-1.x-xdebug xdebug
	docker build --no-cache --build-arg PHP_VERSION=$(PHP_VERSION) --build-arg IMAGE=$(REGISTRY)-cli:$(PHP_VERSION)-1.x-dev -t $(REGISTRY)-cli:$(PHP_VERSION)-1.x-xdebug xdebug
	
	# Building CircleCI images.
	docker build --no-cache --build-arg PHP_VERSION=$(PHP_VERSION) --build-arg IMAGE=$(REGISTRY)-cli:$(PHP_VERSION)-1.x-dev --build-arg NODE_VERSION=$(NODE_VERSION) -t $(REGISTRY)-circleci:$(PHP_VERSION)-1.x circleci

push:
	# Pushing production images.
	docker push $(REGISTRY):$(PHP_VERSION)-1.x
	docker push $(REGISTRY)-fpm:$(PHP_VERSION)-1.x
	docker push $(REGISTRY)-cli:$(PHP_VERSION)-1.x

	# Pushing dev images.
	docker push $(REGISTRY)-fpm:$(PHP_VERSION)-1.x-dev
	docker push $(REGISTRY)-cli:$(PHP_VERSION)-1.x-dev

	# Pushing Xdebug images.
	docker push $(REGISTRY)-fpm:$(PHP_VERSION)-1.x-xdebug
	docker push $(REGISTRY)-cli:$(PHP_VERSION)-1.x-xdebug

	# Pushing CircleCI images.
	docker push $(REGISTRY)-circleci:$(PHP_VERSION)-1.x

.PHONY: *
