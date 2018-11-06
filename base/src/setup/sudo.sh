#!/usr/bin/env bash

set -xe

echo "Install JRE"

apt install -y sudo

echo 'ALL ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
