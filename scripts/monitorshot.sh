#!/bin/bash

# Get available monitors using xrandr
monitors=$(xrandr | grep ' connected' | awk '{print $1}')

# Use Rofi to select monitor
selected_monitor=$(echo "$monitors" | rofi -dmenu -p "Select a monitor")

# Check if a monitor is selected
if [ -n "$selected_monitor" ]; then
    index=0
    # Loop through each monitor
    for monitor in $monitors; do
        # Check if the current monitor matches the selected one
        if [ "$monitor" = "$selected_monitor" ]; then
            # Take screenshot using scrot
            scrot -d 1 -z --monitor $index  -q 100 ~/Pictures/%d-%m-%Y-%H%M%s.png -e "xclip -selection clipboard -t image/png -i \$f"
            notify-send "Screenshot saved in Clipboard"
            break
        fi
        ((index++))
    done
else
    notify-send "No monitor selected. Exiting."
fi
