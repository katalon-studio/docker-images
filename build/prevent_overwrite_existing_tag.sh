#!/usr/bin/env bash

set -xe

ksversion=$1

if curl --output /dev/null --silent --head --fail https://index.docker.io/v1/repositories/katalonstudio/katalon/tags/$ksversion; then
  exit 1
else
  exit 0
fi