#!/bin/bash
### BEGIN INIT INFO
# Provides:          katalon
# Required-Start:    $all
# Required-Stop:
# Default-Start:     2 3 4 5
# Default-Stop:
# Short-Description: Start Xvfb
### END INIT INFO

XVFB=/usr/bin/Xvfb
XVFBARGS="$DISPLAY -ac -screen 0 1280x800x24 +extension RANDR"
PIDFILE=/var/xvfb_${DISPLAY:1}.pid
case "$1" in
  start)
    echo -n "Starting virtual X frame buffer: Xvfb"
    /sbin/start-stop-daemon --start --quiet --pidfile $PIDFILE --make-pidfile --background --exec $XVFB -- $XVFBARGS
    echo "."
    ;;
  stop)
    echo -n "Stopping virtual X frame buffer: Xvfb"
    /sbin/start-stop-daemon --stop --quiet --pidfile $PIDFILE
    echo "."
    ;;
  restart)
    $0 stop
    $0 start
    ;;
  *)
  echo "Usage: /etc/init.d/xvfb {start|stop|restart}"
  exit 1
esac
exit 0