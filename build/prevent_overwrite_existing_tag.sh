#!/usr/bin/env bash

set -xe

ksversion=$1

function docker_tag_exists() {
    EXISTS=$(curl -s https://hub.docker.com/v2/repositories/katalonstudio/katalon/tags/?page_size=10000 | jq -r "[.results | .[] | .name == \"$ksversion\"] | any")
    test $EXISTS = true
}

if docker_tag_exists; then
    exit 1
else
    exit 0
fi