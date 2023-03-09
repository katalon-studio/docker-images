#!/bin/bash

set -x
# Skip set -e to save the reports

echo "Starting Katalon Studio"

cat $KATALON_VERSION_FILE

usernam=katalon
exec gosu $username upgrade-web-browsers.sh "$@"

args=("$KATALON_KATALON_INSTALL_DIR/katalonc" "$@")

xvfb-run -s "-screen 0 $DISPLAY_CONFIGURATION" "${args[@]}"
ret_code=$?

exit $ret_code
