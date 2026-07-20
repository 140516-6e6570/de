#!/bin/sh
CDIR="~/git/de/xinit"

$CDIR/xrandr.sh		&
$CDIR/mouse.sh		&
$CDIR/startup_progs.sh	&

exec stumpwm
