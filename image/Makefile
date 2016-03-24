build :
	docker build \
		-t $(DOCKER_BUILD_REGISTRY)/telegraf:$(DOCKER_BUILD_TAG) \
		.

bash : build
	docker run -i -t --rm \
		$(DOCKER_BUILD_REGISTRY)/telegraf:$(DOCKER_BUILD_TAG) \
		bash

run : build
	docker run -i -t --rm \
		$(DOCKER_BUILD_REGISTRY)/telegraf:$(DOCKER_BUILD_TAG)

push : build
	docker push $(DOCKER_BUILD_REGISTRY)/telegraf:$(DOCKER_BUILD_TAG)
