#!/bin/bash

INSTANCE_IDS="$( docker ps -a | grep "$DOCKER_BUILD_REGISTRY/telegraf" | awk '{print $1}' )"
if [ -n "$INSTANCE_IDS" ]; then

    echo "Deleting instances"
    docker rm -f $INSTANCE_IDS
fi

IMAGE_IDS="$( docker images | grep "$DOCKER_BUILD_REGISTRY/telegraf" | awk '{print $3}' )"
if [ -n "$IMAGE_IDS" ]; then

    echo "Deleting images"
    docker rmi -f $IMAGE_IDS
fi
