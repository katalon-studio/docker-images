#!/usr/bin/env bash

set -xe

docker rmi katalonstudio/katalon:test || echo 'No image to delete.'