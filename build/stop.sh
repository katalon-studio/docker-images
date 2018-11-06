#!/usr/bin/env bash

set -xe

docker stop $(docker ps -a -q)