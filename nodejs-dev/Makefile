include ../meta.mk

REV := $(shell cat NODE_VERSION)

.PHONY: container
container: .latest_container Dockerfile

Dockerfile: Dockerfile.in
	sed "s/__NODE_VERSION__/$(REV)/g" Dockerfile.in > $@
