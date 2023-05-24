#!/bin/bash

set -xe

ksversion=$1
docker build -t katalon-katalon -f src/Dockerfile --build-arg ARCH=arm64v8 KATALON_STUDIO_VERSION=$ksversion .
