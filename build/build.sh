#!/bin/bash

set -xe

ksversion=$1

docker buildx create --name mybuilder --use
docker buildx inspect --bootstrap
docker buildx build  --output type=docker --platform linux/amd64,linux/arm64 -t katalon-katalon -f src/Dockerfile --build-arg KATALON_STUDIO_VERSION=$ksversion .