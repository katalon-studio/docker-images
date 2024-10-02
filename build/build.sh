#!/bin/bash

set -xe

ksversion=$1
export DOCKER_BUILDKIT=1

docker buildx create --name mybuilder --use
docker buildx inspect --bootstrap
docker buildx build -t katalon-katalon -f src/Dockerfile --build-arg KATALON_STUDIO_VERSION=$ksversion .