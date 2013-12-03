include ../meta.mk

.PHONY: container
container: .latest_container Dockerfile

Dockerfile: Dockerfile.in
	sed "s/__NODE_VERSION__/$(shell cat NODE_VERSION)/g" Dockerfile.in > $@
