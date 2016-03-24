#!/bin/bash
set -eu

CACHE_DIRECTORY=~/cache
mkdir -p "$CACHE_DIRECTORY";

DOCKER_IMAGES_FILE=$CACHE_DIRECTORY/dockerImages.tar

if [[ -e "$DOCKER_IMAGES_FILE" ]]; then

    echo "Restoring docker images from $DOCKER_IMAGES_FILE"
    docker load -i "$DOCKER_IMAGES_FILE"

else

    echo "Pulling docker images"

    docker pull ubuntu:14.04

    echo "Saving docker images to $DOCKER_IMAGES_FILE"
    docker save \
        ubuntu:14.04 \
        > "$DOCKER_IMAGES_FILE"

fi