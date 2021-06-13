#!/bin/bash

set -x
# Skip set -e to save the reports

echo "Starting Katalon Studio"

cat $KATALON_VERSION_FILE

# When I wanna use self-sign certificates
# in docker -v ./certs:/usr/local/share/ca-certificates
echo "Update CA certificates"
/usr/sbin/update-ca-certificates

args=("$KATALON_KATALON_INSTALL_DIR/katalonc" "$@")

xvfb-run -s "-screen 0 $DISPLAY_CONFIGURATION" "${args[@]}"
ret_code=$?

exit $ret_code
