#!/bin/sh

# kill existing polybar instance
pkill polybar

# wait until the process have been shut down
# while pgrep -x polybar >/dev/null; do sleep 1; done

screens=$(xrandr --listactivemonitors | \grep -v "Monitors" | cut -d" " -f 6)
screen_count=$(echo "$screens" | wc -l) 

if [[ $screen_count == 1 ]]; then
	polybar -q --reload main &
else
	primary=$(xrandr --query | \grep primary | cut -d" " -f1)

	for m in $screens; do
		if [[ $primary == $m ]]; then
			polybar -q --reload main &
		else
			MONITOR=$m polybar -q --reload second &
		fi
	done
fi
