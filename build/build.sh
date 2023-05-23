#!/bin/bash

set -xe

ksversion=$1
docker buildx create --use
docker buildx build  -t katalon-katalon -f src/Dockerfile --build-arg KATALON_STUDIO_VERSION=$ksversion --platform=linux/amd64,linux/arm64.