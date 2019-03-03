#!/usr/bin/make -f

base:
	docker build -t skpr/base:1.x base


nginx: base
	docker build -t skpr/nginx:1.x nginx

nginx-exporter:
	docker build -t skpr/nginx-exporter:v0.2.0 nginx-exporter

define build_php
	docker build --build-arg PHP_VERSION=${1} -t skpr/php:${1}-1.x php/base
	docker build --build-arg PHP_VERSION=${1} -t skpr/php-fpm:${1}-1.x php/fpm
	docker build --build-arg PHP_VERSION=${1} -t skpr/php-cli:${1}-1.x php/cli
endef

php: base
	$(call build_php,7.1)
	$(call build_php,7.2)
	$(call build_php,7.3)

kubebuilder:
	docker build -t skpr/kubebuilder:v1.0.6 kubebuilder

fpm-exporter:
	docker build -t skpr/fpm-exporter:v1.0.0 fpm-exporter

.PHONY: base nginx php kubebuilder nginx-exporter fpm-exporter
