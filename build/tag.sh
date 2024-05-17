#!/bin/bash

set -xe

ksversion=$1

if [ -n "$ksversion" ]; then
    docker tag katalon-katalon katalonstudio/katalon:$ksversion
fi
