#!/bin/bash

set -x
# Skip set -e to save the reports

echo "Starting Katalon Studio"

cat $KATALON_VERSION_FILE

echo "Upgrade Chrome browser..."
apt --only-upgrade install google-chrome-stable 

echo "Upgrade Firefox browser..."
apt --only-upgrade install firefox

echo "Upgrade Edge Chromium browser..."
apt --only-upgrade install microsoft-edge-stable

args=("$KATALON_KATALON_INSTALL_DIR/katalonc" "$@")

xvfb-run -s "-screen 0 $DISPLAY_CONFIGURATION" "${args[@]}"
ret_code=$?

exit $ret_code
