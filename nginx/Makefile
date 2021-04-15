#!/usr/bin/make -f

REGISTRY=skpr/nginx

build:
	docker build -t $(REGISTRY):1.x .
	docker run -it --hostname=php-fpm --read-only $(REGISTRY):1.x nginx -t
	docker build -t $(REGISTRY):1.x-dev dev
	docker run -it --hostname=php-fpm --read-only $(REGISTRY):1.x-dev nginx -t

push:
	docker push $(REGISTRY):1.x
	docker push $(REGISTRY):1.x-dev

.PHONY: *
