#!/bin/bash

set -xe

ksversion=$1
firstTagName=$2
secondTagName=$3

if [-z "$secondTagName"]; then
    docker buildx build --platform linux/amd64,linux/arm64 --push -t  katalonstudio/katalon:$firstTagName -f src/Dockerfile --build-arg KATALON_STUDIO_VERSION=$ksversion .
else
    docker buildx build --platform linux/amd64,linux/arm64 --push -t  katalonstudio/katalon:$firstTagName -t  katalonstudio/katalon:$secondTagName -f src/Dockerfile --build-arg KATALON_STUDIO_VERSION=$ksversion .
fi
