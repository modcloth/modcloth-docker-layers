DOCKER ?= sudo docker
REV ?= $(git describe --always)
BUILD_FLAGS ?= -no-cache=true -rm=true
PROJECT ?= $(shell basename $(PWD))
REGISTRY ?= quay.io/modcloth

all:
	@echo "Available targets:"
	@echo "  * clean     - remove all local images (and tags) for $(PROJECT)"
	@echo "  * container - build a Docker container for $(PROJECT)"
	@echo "  * latest    - tag the latest container for $(PROJECT) as 'latest'"
	@echo "  * push      - push $(REGISTRY)/$(PROJECT)"

container: .latest_container Dockerfile

latest: .latest_tagged

push: .latest_pushed

clean:
	rm -f .latest_container .latest_tagged .latest_pushed
	$(DOCKER) images | grep $(REGISTRY)/$(PROJECT) | awk '{ print $$3 }' | \
	  sort | uniq | xargs $(DOCKER) rmi


.latest_container:
	rm -f $@
	$(DOCKER) build -t $(REGISTRY)/$(PROJECT):$(REV) $(BUILD_FLAGS) . | tee .container_output
	awk '/^Successfully built/ { print $$NF }' .container_output | tail -1 > $@

.latest_tagged: .latest_container
	$(DOCKER) tag $(shell cat .latest_container) $(REGISTRY)/$(PROJECT) latest && touch $@

.latest_pushed: .latest_tagged
	$(DOCKER) push $(REGISTRY)/$(PROJECT)


.PHONY: container latest push clean
