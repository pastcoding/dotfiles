#!/bin/bash

echo "$(playerctl -p spotify volume | awk '{printf "%.0f", $1 * 100}')%"

