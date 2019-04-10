#!/usr/bin/env bash

set -xe

echo "Install tools"

apt update
apt -y install apt-utils
apt -y install wget
apt -y install unzip
apt -y install curl
