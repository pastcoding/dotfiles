#!/bin/bash


battery_status=$(polychromatic-cli -k | \grep --after-context 6 "Razer Naga Pro" | \grep -i "Battery" | awk -F 'y' '{print $2}')

if [[ -n "$battery_status" ]]; then
  echo "󰍽 $battery_status"
else
  echo "󰍾 "
fi
