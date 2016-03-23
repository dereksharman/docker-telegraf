#!/bin/bash
set -eu
clear

docker images | grep "$DOCKER_BUILD_REGISTRY/telegraf" | sort