#!/usr/bin/env bash

set -xe

echo "Install Mozilla Firefox"

FIREFOX=59.0.3

wget --no-check-certificate https://ftp.mozilla.org/pub/mozilla.org/firefox/releases/$FIREFOX/linux-x86_64/en-US/firefox-$FIREFOX.tar.bz2
tar -xjf firefox-$FIREFOX.tar.bz2 -C /usr/lib
ln -s /usr/lib/firefox/firefox /usr/bin/firefox
rm -rf firefox-$FIREFOX.tar.bz2

# Install 'pulseaudio' package to support WebRTC audio streams
apt install -y pulseaudio

echo "$(firefox -version)" >> $KATALON_VERSION_FILE
