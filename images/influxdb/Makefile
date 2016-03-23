ifndef DOCKER_BUILD_REGISTRY
DOCKER_BUILD_REGISTRY=cantireinnovations
endif

ifndef DOCKER_BUILD_TAG
DOCKER_BUILD_TAG=latest
endif

build :
	docker build \
		-t $(DOCKER_BUILD_REGISTRY)/telegraf-influxdb:$(DOCKER_BUILD_TAG) \
		.

bash : build
	docker run -i -t --rm \
		$(DOCKER_BUILD_REGISTRY)/telegraf-influxdb:$(DOCKER_BUILD_TAG) \
		bash

run : build
	docker run -i -t --rm \
		$(DOCKER_BUILD_REGISTRY)/telegraf-influxdb:$(DOCKER_BUILD_TAG)

push : build
	docker push $(DOCKER_BUILD_REGISTRY)/telegraf-influxdb:$(DOCKER_BUILD_TAG)
