#!/usr/bin/env bash

set -xe

echo "Install tools"

apt update
apt install -y apt-utils
apt install -y wget