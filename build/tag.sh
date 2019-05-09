#!/usr/bin/env bash

set -xe

ksversion=$1

docker tag katalon-katalon katalonstudio/katalon:$ksversion