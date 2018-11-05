#!/usr/bin/env bash

set -xe

echo "Install Xvfb"

apt install -y xvfb

cp scripts/xvfb.sh /etc/init.d/xvfb
chmod +x /etc/init.d/xvfb
update-rc.d xvfb enable
