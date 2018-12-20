#!/usr/bin/env bash

set -xe

echo "Install CircleCI tools"

apt -y --no-install-recommends install git ssh tar gzip ca-certificates
