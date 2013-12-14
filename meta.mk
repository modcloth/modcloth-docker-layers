DOCKER ?= sudo docker
REV ?= $(shell git describe --always)
BUILD_FLAGS ?= -no-cache=true -rm=true
PROJECT ?= $(shell basename $(PWD))
REGISTRY ?= quay.io/modcloth
LATEST ?= $(shell $(DOCKER) images | grep $(REGISTRY)/$(PROJECT) | head -n 1 | awk '{print $$3}' )

export DOCKER
export REV
export BUILD_FLAGS
export PROJECT
export REGISTRY
export LATEST

all:
	@echo "Available targets:"
	@echo "  * clean     - remove all local images (and tags) for $(PROJECT)"
	@echo "  * container - build a Docker container for $(PROJECT)"
	@echo "  * latest    - builds and tags the latest container for $(PROJECT) as 'latest'"
	@echo "  * pull      - pull down previous docker builds of $(REGISTRY)/$(PROJECT)"
	@echo "  * push      - push $(REGISTRY)/$(PROJECT)"
	@echo "  * tag       - tags the lastest image as 'latest'"

container: .latest_container Dockerfile

latest: build_and_tag

tag: delete_current_tag .latest_tagged

push: .latest_pushed

delete_current_tag:
	rm -f .latest_tagged

clean:
	rm -f .latest_container .latest_tagged .latest_pushed .container_output
	export IMAGES="$(shell $(DOCKER) images | grep $(REGISTRY)/$(PROJECTS))" ; \
		test -z "$$IMAGES" || echo $$IMAGES | awk '{ print $$3 }' | \
		sort | uniq | xargs $(DOCKER) rmi

.latest_container: pull
	rm -f $@
	$(DOCKER) build -t $(REGISTRY)/$(PROJECT):$(REV) $(BUILD_FLAGS) . | tee .container_output
	awk '/^Successfully built/ { print $$NF }' .container_output | tail -1 > $@

.latest_tagged:
	( test -z "$(LATEST)" && echo 'Nothing to tag!' ) || $(DOCKER) tag $(LATEST) $(REGISTRY)/$(PROJECT):latest && touch $@

build_and_tag: .latest_container tag

pull:
	$(DOCKER) pull $(REGISTRY)/$(PROJECT) || true

.latest_pushed: .latest_tagged
	$(DOCKER) push $(REGISTRY)/$(PROJECT)

.PHONY: container latest push clean build_and_tag tag delete_current_tag pull
