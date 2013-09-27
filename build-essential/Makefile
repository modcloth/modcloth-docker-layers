DOCKER ?= sudo docker
REV := $(shell cat VERSION)
PROJECT ?= build-essential
REGISTRY ?= dr.prod.modcloth.com
COMMAND ?=

all:
	@echo "Available targets:"
	@echo "  * container  - build a Docker container for $(PROJECT)"

container:
	$(DOCKER) build -t $(REGISTRY)/$(PROJECT):$(REV) .

.PHONY: container
