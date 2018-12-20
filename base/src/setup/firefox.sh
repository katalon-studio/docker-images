#!/usr/bin/env bash

set -xe

echo "Install Mozilla Firefox"

apt -y install firefox

# Install 'pulseaudio' package to support WebRTC audio streams
apt -y install pulseaudio

echo "$(firefox -version)" >> $KATALON_VERSION_FILE
