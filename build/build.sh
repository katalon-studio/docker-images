#!/usr/bin/env bash

set -xe

docker build -t katalon-base -f base/Dockerfile base
docker build -t katalon-katalon -f katalon/Dockerfile katalon
docker build -t katalon-circleci -f katalon-circleci/Dockerfile katalon-circleci