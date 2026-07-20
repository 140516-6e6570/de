#!/bin/sh
CDIR=$(dirname "$(realpath "$0")") 

$CDIR/xrandr.sh	&
$CDIR/mouse.sh		&
$CDIR/startup_progs.sh &

exec stumpwm
