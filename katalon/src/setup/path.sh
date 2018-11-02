#!/usr/bin/env bash

set -xe

echo "Add katalon-execute.sh to PATH"

echo 'export PATH="$KATALON_KATALON_ROOT_DIR/scripts:$PATH"' >> /etc/profile