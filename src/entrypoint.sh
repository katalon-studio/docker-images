#!/bin/bash

set -xe

echo "Entrypoint"

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