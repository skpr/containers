.PHONY: *
#!/usr/bin/make -f

REGISTRY=docker.io/skpr/goreleaser

build:
	docker build -t $(REGISTRY):latest .

push:
	docker push $(REGISTRY):latest

.PHONY: *
