#!/usr/bin/env bash

set -xe

echo "Install Mozilla Firefox"

apt install -y firefox

# Install 'pulseaudio' package to support WebRTC audio streams
apt install -y pulseaudio

echo "$(firefox -version)" >> $KATALON_VERSION_FILE
