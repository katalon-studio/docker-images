#!/usr/bin/env bash

set -xe

docker tag katalon-katalon katalonstudio/katalon:test
docker tag katalon-circleci katalonstudio/katalon-circleci:test