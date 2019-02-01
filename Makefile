#!/usr/bin/make -f

define build_and_push
	cd ${1} && docker build -t ${2} .
	docker push ${2}
endef

base:
	$(call build_and_push,base,skpr/base:1.x)

nginx: base
	$(call build_and_push,nginx,skpr/nginx:1.x)

php: base
	$(call build_and_push,php/base,skpr/php:7.2-1.x)
	$(call build_and_push,php/fpm,skpr/php-fpm:7.2-1.x)
	$(call build_and_push,php/cli,skpr/php-cli:7.2-1.x)

kubebuilder:
	$(call build_and_push,kubebuilder,skpr/kubebuilder:v1.0.6)

nginx-exporter:
	$(call build_and_push,nginx-exporter,skpr/nginx-exporter:v0.2.0)

fpm-exporter:
	$(call build_and_push,fpm-exporter,skpr/fpm-exporter:v1.0.0)

.PHONY: base nginx php kubebuilder nginx-exporter fpm-exporter
