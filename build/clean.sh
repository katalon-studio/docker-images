#!/usr/bin/env bash

set -xe

ksversion=$1

docker rmi katalonstudio/katalon:$ksversion || echo 'No image to delete.'