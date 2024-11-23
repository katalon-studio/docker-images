#!/bin/bash

set -xe

ksversion=$1
firstTagName=$2
isProduction=$3
secondTagName=$4

if [ -z "$secondTagName" ]; then
    docker buildx build --platform linux/amd64,linux/arm64 -t  katalonstudio/katalon-tmp:$firstTagName -f src/Dockerfile --build-arg KATALON_STUDIO_VERSION=$ksversion --build-arg IS_PRODUCTION=$isProduction .
else
    docker buildx build --platform linux/amd64,linux/arm64 -t  katalonstudio/katalon-tmp:$firstTagName -t  katalonstudio/katalon-tmp:$secondTagName -f src/Dockerfile --build-arg KATALON_STUDIO_VERSION=$ksversion --build-arg IS_PRODUCTION=$isProduction .
fi
