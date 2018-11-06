#!/usr/bin/env bash

set -xe

docker build -t katalon-base -f base/Dockerfile base
docker build -t katalon-katalon -f katalon/Dockerfile katalon