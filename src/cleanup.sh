#!/bin/bash

set -xe

echo "Clean up"

apt clean all
rm -rf /var/lib/apt/lists/*
cat $KATALON_VERSION_FILE

echo "Clean up done"