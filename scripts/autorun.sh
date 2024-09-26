#!/bin/bash

	xrdb -merge ~/.config/X11/.Xresources &
	/usr/lib/xfce-polkit/xfce-polkit &
	picom -b &
	dunst &
	udiskie -s &
	~/.fehbg &
    # wal -R -n &
	unclutter --timeout 2 --ignore-scrolling &
	bitwarden-desktop &
	blueman-applet &
	xscreensaver &

if pgrep -x bspwm >/dev/null; then
	sxhkd -c ~/.config/sxhkd/bspwmrc &
	bash ~/.config/scripts/bar.sh
	# deckmaster -deck ~/.config/deckmaster/main.deck &
else
	sxhkd -c ~/.config/sxhkd/sxhkdrc &
fi
