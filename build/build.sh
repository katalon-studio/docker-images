#!/bin/bash

set -xe

ksversion=$1

docker buildx build --platform=linux/amd64,linux/arm64 -t katalon-katalon -f src/Dockerfile --build-arg KATALON_STUDIO_VERSION=$ksversion .