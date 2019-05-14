#!/usr/bin/env bash

set -xe

ksversion=$1

if curl --output /dev/null --silent --head --fail https://hub.docker.com/v2/repositories/katalonstudio/katalon/tags/$ksversion; then
  exit 0
else
  exit 1
fi
