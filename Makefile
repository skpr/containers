#!/usr/bin/make -f

define build_and_push
	cd ${1} && docker build -t ${2} .
	docker push ${2}
endef

base:
	$(call build_and_push,base,skpr/base:latest)

nginx: base
	$(call build_and_push,nginx,skpr/nginx:latest)

php: base
	$(call build_and_push,php/base,skpr/php:latest)
	$(call build_and_push,php/fpm,skpr/php-fpm:latest)
	$(call build_and_push,php/cli,skpr/php-cli:latest)

.PHONY: base nginx php