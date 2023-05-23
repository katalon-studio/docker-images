#!/bin/bash

set -xe
echo "Build"
ksversion=$1
docker buildx create --use
docker buildx build --platform=linux/amd64,linux/arm64 -t katalon-katalon -f src/Dockerfile --build-arg KATALON_STUDIO_VERSION=$ksversion .
echo "Built done"
