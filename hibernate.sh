#!/bin/sh

/usr/bin/slock &
dbus-send --system --print-reply --dest="org.freedesktop.UPower" \
/org/freedesktop/UPower org.freedesktop.UPower.Hibernate