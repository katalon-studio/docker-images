#!/usr/bin/env bash

set -xe

docker rm $(docker ps -a -q)
docker rmi -f $(docker images -a -q)