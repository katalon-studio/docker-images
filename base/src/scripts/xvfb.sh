#!/bin/bash

set -xe

echo "Starting X"

/usr/bin/Xvfb $DISPLAY -ac -screen 0 1280x800x24 +extension RANDR