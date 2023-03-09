#!/bin/bash

set -xe

echo "Entrypoint"

# exec upgrade-web-browsers.sh "$@"
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

if [ -z "$KATALON_USER_ID" ]; then
	exec "$@"
else
    echo "Starting with UID : $KATALON_USER_ID"
    username=katalon
    useradd --shell /bin/bash -u $KATALON_USER_ID -o -c "" -m $username
    export HOME=/home/$username
    chown -R $KATALON_USER_ID $KATALON_SOFTWARE_DIR
    exec gosu $username "$@"
fi