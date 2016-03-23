ifndef DOCKER_BUILD_REGISTRY
DOCKER_BUILD_REGISTRY=cantireinnovations
endif

ifndef DOCKER_BUILD_TAG
DOCKER_BUILD_TAG=latest
endif

build :
	docker build \
		-t $(DOCKER_BUILD_REGISTRY)/telegraf-base:$(DOCKER_BUILD_TAG) \
		.

bash:
run:

push : build
	docker push $(DOCKER_BUILD_REGISTRY)/telegraf-base:$(DOCKER_BUILD_TAG)
