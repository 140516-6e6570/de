#!/bin/sh
eval "$(dbus-launch --sh-syntax --exit-with-session)"

export DBUS_SESSION_BUS_ADDRESS
export DBUS_SESSION_BUS_PID
export XDG_SESSION_TYPE=x11

CDIR=$(dirname "$(realpath "$0")") 

$CDIR/xrandr.sh	&
$CDIR/mouse.sh		&
$CDIR/startup_progs.sh &

/usr/libexec/xdg-desktop-portal -r &
/usr/libexec/xdg-desktop-portal-gtk -r &

dbus-run-session stumpwm
