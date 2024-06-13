#!/bin/bash

set -xe

ksversion=$1

docker build -t katalon-katalon -f src/Dockerfile.slim --build-arg KATALON_STUDIO_VERSION=$ksversion .