#!/usr/bin/env bash

set -xe

ksversion = $1

function docker_tag_exists() {
  curl --silent -f -lSL https://index.docker.io/v1/repositories/$1/tags/$2 > /dev/null
}

if docker_tag_exists katalonstudio/katalon $ksversion; then
  exit 1
fi