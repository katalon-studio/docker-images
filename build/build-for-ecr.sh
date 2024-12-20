#!/bin/bash

set -xe

ksversion=$1
tagName=$2
isProduction=$3

docker buildx build --platform linux/amd64,linux/arm64 --push -t  002582244933.dkr.ecr.us-east-1.amazonaws.com/katalon-studio:$tagName -f src/Dockerfile --build-arg KATALON_STUDIO_VERSION=$ksversion --build-arg IS_PRODUCTION=$isProduction .
