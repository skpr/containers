#!/usr/bin/make -f

DOCKERHUB_REGISTRY=docker.io/skpr/php
GITHUB_REGISTRY=ghcr.io/skpr/php
NODE_VERSION=10-1.x

build:
	# Building production images.
	docker build --no-cache --build-arg PHP_VERSION=$(PHP_VERSION) -t $(DOCKERHUB_REGISTRY):$(PHP_VERSION)-1.x -t $(GITHUB_REGISTRY):$(PHP_VERSION)-1.x base
	docker build --no-cache --build-arg PHP_VERSION=$(PHP_VERSION) -t $(DOCKERHUB_REGISTRY)-fpm:$(PHP_VERSION)-1.x -t $(GITHUB_REGISTRY)-fpm:$(PHP_VERSION)-1.x fpm
	docker build --no-cache --build-arg PHP_VERSION=$(PHP_VERSION) -t $(DOCKERHUB_REGISTRY)-cli:$(PHP_VERSION)-1.x -t $(GITHUB_REGISTRY)-cli:$(PHP_VERSION)-1.x cli
	
	# Testing production images.
	container-structure-test test --image $(DOCKERHUB_REGISTRY)-fpm:$(PHP_VERSION)-1.x --config fpm/tests.yml
	
	# Building dev images.
	docker build --no-cache --build-arg PHP_VERSION=$(PHP_VERSION) --build-arg IMAGE=$(DOCKERHUB_REGISTRY)-fpm:$(PHP_VERSION)-1.x -t $(DOCKERHUB_REGISTRY)-fpm:$(PHP_VERSION)-1.x-dev -t $(GITHUB_REGISTRY)-fpm:$(PHP_VERSION)-1.x-dev dev
	docker build --no-cache --build-arg PHP_VERSION=$(PHP_VERSION) --build-arg IMAGE=$(DOCKERHUB_REGISTRY)-cli:$(PHP_VERSION)-1.x -t $(DOCKERHUB_REGISTRY)-cli:$(PHP_VERSION)-1.x-dev -t $(GITHUB_REGISTRY)-cli:$(PHP_VERSION)-1.x-dev dev
	
	# Building Xdebug images.
	docker build --no-cache --build-arg PHP_VERSION=$(PHP_VERSION) --build-arg IMAGE=$(DOCKERHUB_REGISTRY)-fpm:$(PHP_VERSION)-1.x-dev -t $(DOCKERHUB_REGISTRY)-fpm:$(PHP_VERSION)-1.x-xdebug -t $(GITHUB_REGISTRY)-fpm:$(PHP_VERSION)-1.x-xdebug xdebug
	docker build --no-cache --build-arg PHP_VERSION=$(PHP_VERSION) --build-arg IMAGE=$(DOCKERHUB_REGISTRY)-cli:$(PHP_VERSION)-1.x-dev -t $(DOCKERHUB_REGISTRY)-cli:$(PHP_VERSION)-1.x-xdebug -t $(GITHUB_REGISTRY)-cli:$(PHP_VERSION)-1.x-xdebug xdebug
	
	# Building CircleCI images.
	docker build --no-cache --build-arg PHP_VERSION=$(PHP_VERSION) --build-arg IMAGE=$(DOCKERHUB_REGISTRY)-cli:$(PHP_VERSION)-1.x-dev --build-arg NODE_VERSION=$(NODE_VERSION) -t $(DOCKERHUB_REGISTRY)-circleci:$(PHP_VERSION)-1.x -t $(GITHUB_REGISTRY)-circleci:$(PHP_VERSION)-1.x  circleci

push:
	# Pushing production images
	docker push $(DOCKERHUB_REGISTRY):$(PHP_VERSION)-1.x
	docker push $(DOCKERHUB_REGISTRY)-fpm:$(PHP_VERSION)-1.x
	docker push $(DOCKERHUB_REGISTRY)-cli:$(PHP_VERSION)-1.x

	docker push $(GITHUB_REGISTRY):$(PHP_VERSION)-1.x
	docker push $(GITHUB_REGISTRY)-fpm:$(PHP_VERSION)-1.x
	docker push $(GITHUB_REGISTRY)-cli:$(PHP_VERSION)-1.x

	# Pushing dev images.
	docker push $(DOCKERHUB_REGISTRY)-fpm:$(PHP_VERSION)-1.x-dev
	docker push $(DOCKERHUB_REGISTRY)-cli:$(PHP_VERSION)-1.x-dev

	docker push $(GITHUB_REGISTRY)-fpm:$(PHP_VERSION)-1.x-dev
	docker push $(GITHUB_REGISTRY)-cli:$(PHP_VERSION)-1.x-dev

	# Pushing Xdebug images.
	docker push $(DOCKERHUB_REGISTRY)-fpm:$(PHP_VERSION)-1.x-xdebug
	docker push $(DOCKERHUB_REGISTRY)-cli:$(PHP_VERSION)-1.x-xdebug

	docker push $(GITHUB_REGISTRY)-fpm:$(PHP_VERSION)-1.x-xdebug
	docker push $(GITHUB_REGISTRY)-cli:$(PHP_VERSION)-1.x-xdebug

	# Pushing CircleCI images.
	docker push $(DOCKERHUB_REGISTRY)-circleci:$(PHP_VERSION)-1.x

	docker push $(GITHUB_REGISTRY)-circleci:$(PHP_VERSION)-1.x

.PHONY: *
