#!/bin/bash

status=$(pactl get-source-mute @DEFAULT_SOURCE@)

if [[ "$status" == *"yes" ]]; then
	echo "󰍭"
else
	echo "󰍬"
fi
