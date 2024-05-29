#!/bin/bash

set -xe

ksversion=$1

if [ -n "$ksversion" ]; then
    docker push katalonstudio/katalon:$ksversion
fi
