#!/usr/bin/env bash

set -xe

echo "Install tools"

apt update
apt -y --no-install-recommends install apt-utils
apt -y --no-install-recommends install wget