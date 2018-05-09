#!/usr/bin/env bash

docker rm $(docker ps -a -q)
docker rmi -f $(docker images -a -q)