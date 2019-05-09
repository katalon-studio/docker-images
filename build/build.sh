#!/usr/bin/env bash

set -xe

ksversion=$1

docker build -t katalon-base -f base/Dockerfile base
docker build -t katalon-katalon -f katalon/Dockerfile --build-arg KATALON_STUDIO_VERSION=$ksversion katalon