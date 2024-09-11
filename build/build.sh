#!/bin/bash

set -xe

ksversion=$1
specific_download_link=$2

docker build -t katalon-katalon: -f src/Dockerfile --build-arg KATALON_STUDIO_VERSION=$ksversion --build-arg SPECIFIC_DOWNLOAD_LINK=$specific_download_link .