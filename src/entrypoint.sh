#!/bin/bash

set -xe

echo "Entrypoint"

if [ -z "$KATALON_USER_ID" ]; then
	if [ "$1" == "-docker.autoUpdateBrowsers=true" ]; then
		echo "Upgrade Chrome browser..."
		apt --only-upgrade install google-chrome-stable 

		# echo "Upgrade Firefox browser..."
		# apt --only-upgrade install firefox

		# echo "Upgrade Edge Chromium browser..."
		# apt --only-upgrade install microsoft-edge-stable
		echo "${@:2}"
		exec "${@:2}"
	else	
		exec "$@"
	fi
else
    echo "Starting with UID : $KATALON_USER_ID"
    username=katalon
    useradd --shell /bin/bash -u $KATALON_USER_ID -o -c "" -m $username
    export HOME=/home/$username
    chown -R $KATALON_USER_ID $KATALON_SOFTWARE_DIR
    exec gosu $username "$@"
fi