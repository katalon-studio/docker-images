#!/usr/bin/env bash

set -xe

echo "Install tools"

apt update
apt install -y apt-utils
apt upgrade -y
apt dist-upgrade -y
apt install -y wget