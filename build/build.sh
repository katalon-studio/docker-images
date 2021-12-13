#!/bin/bash

set -xe

ksversion=$1

docker buildx build --platform linux/x86_64 -t katalon-katalon -f src/Dockerfile --build-arg KATALON_STUDIO_VERSION=$ksversion .