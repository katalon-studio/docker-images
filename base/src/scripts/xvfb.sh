#!/usr/bin/env bash

set -xe

XVFB=/usr/bin/Xvfb
XVFBARGS="$DISPLAY -screen 0 $DISPLAY_CONFIGURATION -fbdir /var/run -ac"
PIDFILE=/var/run/xvfb.pid
case "$1" in
  start)
    echo -n "Starting virtual X frame buffer $DISPLAY $DISPLAY_CONFIGURATION"
    start-stop-daemon --start --quiet --pidfile $PIDFILE --make-pidfile --background --exec $XVFB -- $XVFBARGS
    echo "."
    ;;
  stop)
    echo -n "Stopping virtual X frame buffer."
    start-stop-daemon --stop --quiet --pidfile $PIDFILE
    echo "."
    ;;
  restart)
    $0 stop
    $0 start
    ;;
  *)
    echo "Usage: xvfb {start|stop|restart}"
    exit 1
esac

exit 0