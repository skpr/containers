#!/usr/bin/make -f

REGISTRY=skpr/php
NODE_VERSION=10-1.x

build: validate
	# Building production images.
	docker build --no-cache --build-arg PHP_VERSION=$(PHP_VERSION) -t $(REGISTRY):$(PHP_VERSION)-1.x base
	docker build --no-cache --build-arg PHP_VERSION=$(PHP_VERSION) -t $(REGISTRY)-fpm:$(PHP_VERSION)-1.x fpm
	docker build --no-cache --build-arg PHP_VERSION=$(PHP_VERSION) -t $(REGISTRY)-cli:$(PHP_VERSION)-1.x cli
	
	# Testing production images.
	container-structure-test test --image $(REGISTRY):$(PHP_VERSION)-1.x --config base/tests.yml
	container-structure-test test --image $(REGISTRY)-fpm:$(PHP_VERSION)-1.x --config fpm/tests.yml
	container-structure-test test --image $(REGISTRY)-cli:$(PHP_VERSION)-1.x --config cli/tests.yml
	
	# Building dev images.
	docker build --no-cache --build-arg IMAGE=$(REGISTRY)-fpm:$(PHP_VERSION)-1.x -t $(REGISTRY)-fpm:$(PHP_VERSION)-1.x-dev dev
	docker build --no-cache --build-arg IMAGE=$(REGISTRY)-cli:$(PHP_VERSION)-1.x -t $(REGISTRY)-cli:$(PHP_VERSION)-1.x-dev dev
	
	# Building Xdebug images.
	docker build --no-cache --build-arg PHP_VERSION=$(PHP_VERSION) --build-arg IMAGE=$(REGISTRY)-fpm:$(PHP_VERSION)-1.x-dev -t $(REGISTRY)-fpm:$(PHP_VERSION)-1.x-xdebug xdebug
	docker build --no-cache --build-arg PHP_VERSION=$(PHP_VERSION) --build-arg IMAGE=$(REGISTRY)-cli:$(PHP_VERSION)-1.x-dev -t $(REGISTRY)-cli:$(PHP_VERSION)-1.x-xdebug xdebug
	
	# Building CircleCI images.
	# 1.x version is Node 10.
	docker build --no-cache --build-arg PHP_VERSION=$(PHP_VERSION) --build-arg NODE_VERSION=$(NODE_VERSION) -t $(REGISTRY)-circleci:$(PHP_VERSION)-1.x circleci 
	# 2.x is Node 14.
	docker build --no-cache --build-arg PHP_VERSION=$(PHP_VERSION) --build-arg NODE_VERSION=14-1.x -t $(REGISTRY)-circleci:$(PHP_VERSION)-2.x circleci
	# 3.x is Node 16.
	docker build --no-cache --build-arg PHP_VERSION=$(PHP_VERSION) --build-arg NODE_VERSION=16-1.x -t $(REGISTRY)-circleci:$(PHP_VERSION)-3.x circleci

push: validate
	# Pushing production images
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
	docker push $(REGISTRY)-circleci:$(PHP_VERSION)-2.x
	docker push $(REGISTRY)-circleci:$(PHP_VERSION)-3.x

validate:
ifndef PHP_VERSION
	$(error PHP_VERSION is undefined)
endif

.PHONY: *
