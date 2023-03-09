#!/bin/bash

set -x
# Skip set -e to save the reports

echo "Starting Katalon Studio"

cat $KATALON_VERSION_FILE

if grep -q -- "-docker.autoUpdateBrowsers=true" <<< "$@"; then
	if grep -q -- "-browserType=Chrome" <<< "$@"; then
		echo "Upgrade Chrome browser..."
		sudo apt --only-upgrade install google-chrome-stable
	elif grep -q -- "-browserType=Firefox" <<< "$@"; then
		echo "Upgrade Firefox browser..."
		sudo apt --only-upgrade install firefox
	elif grep -q -- "-browserType=Edge Chromium" <<< "$@"; then
		echo "Upgrade Edge Chromium browser..."
		sudo apt --only-upgrade install microsoft-edge-stable
	fi
fi

args=("$KATALON_KATALON_INSTALL_DIR/katalonc" "$@")

xvfb-run -s "-screen 0 $DISPLAY_CONFIGURATION" "${args[@]}"
ret_code=$?

exit $ret_code
