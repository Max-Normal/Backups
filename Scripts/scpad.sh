#!/bin/bash


winclass="$(xdotool search --class scpad)";
if [ -z "$winclass" ]; then
	kitty --class scpad
else
	if [ ! -f /tmp/scpad ]; then
		touch /tmp/scpad && xdo hide "$winclass"
	elif [ -f /tmp/scpad ]; then
		rm /tmp/scpad && xdo show "$winclass"
	fi
fi