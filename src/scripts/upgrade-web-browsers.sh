#!/bin/bash

set -x

if grep -q -- "-docker.autoUpdateBrowsers=true" <<< "$@"; then
	if grep -q -- "-browserType=Chrome" <<< "$@"; then
		echo "Upgrade Chrome browser..."
		apt --only-upgrade install google-chrome-stable
	elif grep -q -- "-browserType=Firefox" <<< "$@"; then
		echo "Upgrade Firefox browser..."
		apt --only-upgrade install firefox
	elif grep -q -- "-browserType=Edge Chromium" <<< "$@"; then
		echo "Upgrade Edge Chromium browser..."
		apt --only-upgrade install microsoft-edge-stable
	fi
fi