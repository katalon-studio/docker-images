#!/bin/bash

set -x
# Skip set -e to save the reports

echo "Starting Katalon Studio"
echo $RANDOM | md5sum | fold -w 32 | head -n 1 > /etc/machine-id

cat $KATALON_VERSION_FILE

args=("$KATALON_KATALON_INSTALL_DIR/katalonc" "$@")

xvfb-run -s "-screen 0 $DISPLAY_CONFIGURATION" "${args[@]}"
ret_code=$?

exit $ret_code
