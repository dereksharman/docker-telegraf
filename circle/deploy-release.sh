#!/bin/bash
set -eu

cd ../image

docker login -u "$DOCKER_USERNAME" -p "$DOCKER_PASSWORD" -e no-reply@cantireinnovations.com

export DOCKER_BUILD_TAG="$CIRCLE_TAG"
make push

export DOCKER_BUILD_TAG="latest"
make push