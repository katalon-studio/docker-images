#!/bin/bash

set -xe

ksversion=$1
firstTagName=$2
isRelease=$3
secondTagName=$4

if [ -z "$secondTagName" ]; then
    docker buildx build --platform linux/amd64,linux/arm64 --push -t  katalonstudio/katalon:$firstTagName -f src/Dockerfile.slim --build-arg KATALON_STUDIO_VERSION=$ksversion --build-arg IS_RELEASE=$isRelease .
else
    docker buildx build --platform linux/amd64,linux/arm64 --push -t  katalonstudio/katalon:$firstTagName -t  katalonstudio/katalon:$secondTagName -f src/Dockerfile.slim --build-arg KATALON_STUDIO_VERSION=$ksversion --build-arg IS_RELEASE=$isRelease .
fi
