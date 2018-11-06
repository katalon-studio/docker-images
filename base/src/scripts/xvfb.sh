#!/bin/bash

set -xe

echo "Starting X"

sudo -E /usr/bin/Xvfb $DISPLAY $DISPLAY_CONFIGURATION &
sudo -E while [ ! -e /tmp/.X11-unix/X99 ]; do sleep 0.1; done
sudo -E xhost +