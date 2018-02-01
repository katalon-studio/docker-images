#!/usr/bin/env bash

set -xe

echo "Make scripts executable"

find $1 -name '*.sh' -exec chmod a+x {} +