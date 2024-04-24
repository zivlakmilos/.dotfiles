#!/usr/bin/env bash

case "$1" in
stop)
	dunstctl set-paused true
	;;
start)
	dunstctl set-paused false
	;;
*)
	echo '|---------------------|'
	echo '|     Notify Setup    |'
	echo '| © Milos Zivlak 2023 |'
	echo '|---------------------|'
	echo ''
	echo 'Options:'
	echo '  - help'
	echo '  - stop'
	echo '  - start'
	;;
esac
