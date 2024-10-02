#!/bin/bash

set -xe

ksversion=$1
export DOCKER_BUILDKIT=1

docker buildx create --name mybuilder --driver docker-container --use --bootstrap
docker buildx build --platform linux/amd64,linux/arm64 --load -t  katalon-katalon -f src/Dockerfile --build-arg KATALON_STUDIO_VERSION=$ksversion .