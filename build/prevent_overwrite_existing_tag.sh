#!/usr/bin/env bash

set -xe

ksversion =$1

if curl --silent -f -lSL https://index.docker.io/v1/repositories/katalonstudio/katalon/tags/$ksversion > /dev/null; then
  exit 1
fi