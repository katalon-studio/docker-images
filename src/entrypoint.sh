#!/bin/bash

set -xe

echo "Entrypoint"

if [ -z "$KATALON_USER_ID" ]; then
    exec "$@"
else
    echo "Starting with UID : $KATALON_USER_ID"
    useradd --shell /bin/bash -u $KATALON_USER_ID -o -c "" -m katalon
    export HOME=/home/katalon
    exec gosu katalon "$@"
fi