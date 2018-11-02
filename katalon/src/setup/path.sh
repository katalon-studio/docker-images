#!/usr/bin/env bash

set -xe

echo "Set PATH for Katalon Studio"

cp scripts/katalon-set-path.sh /etc/profile.d
source /etc/profile.d/katalon-set-path.sh