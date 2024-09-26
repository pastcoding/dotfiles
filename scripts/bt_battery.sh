#!/bin/bash

# Funktion zum Überprüfen des Akkustands eines Geräts
check_device_battery() {
    local DEVICE=$1
    local NAME=$2
    if upower -i $DEVICE | grep -q 'percentage'; then
        local percentage=$(upower -i $DEVICE | grep -E "percentage" | awk '{print $2}')
        echo -n "$NAME $percentage | "
    else
        echo -n "$NAME no battery information | "
    fi
}

# Liste der Geräte (füge hier alle relevanten Geräte hinzu)
DEVICES=(
    "/org/freedesktop/UPower/devices/battery_hid_dco2co26oecoaao72_battery"
    "/org/freedesktop/UPower/devices/battery_hid_5cobao37o0aod1o97_battery"
)

# Namen der Geräte (in der gleichen Reihenfolge wie in DEVICES)
NAMES=(
    "󰌌 "
    "󰖺 "
)

# Überprüfe die Akkustände
for i in "${!DEVICES[@]}"; do
    if [ -n "${DEVICES[$i]}" ]; then
        check_device_battery "${DEVICES[$i]}" "${NAMES[$i]}"
    else
        echo -n "${NAMES[$i]} not connected | "
    fi
done

echo ""
