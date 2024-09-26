#!/bin/bash

# Gerät automatisch ermitteln
DEVICE=$(upower -e | grep '72_battery')

if [ -n "$DEVICE" ]; then
    # Überprüfen, ob das Gerät Informationen zum Akkustand hat
    if upower -i $DEVICE | grep -q 'percentage'; then
        # Akkustand abfragen
        percentage=$(upower -i $DEVICE | grep -E "percentage" | awk '{print $2}')
	echo "󰌌  $percentage"
    fi
else
	echo "󰌐 "
fi
