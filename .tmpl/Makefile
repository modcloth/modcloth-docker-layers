DOCKER ?= sudo docker
REV := $(shell cat VERSION)
PROJECT ?= some-project-name
REGISTRY ?= quay.io/modcloth
COMMAND ?=

all:
	@echo "Available targets:"
	@echo "  * container  - build a Docker container for $(PROJECT)"

container:
	$(DOCKER) build -t $(REGISTRY)/$(PROJECT):$(REV) .

.PHONY: container
