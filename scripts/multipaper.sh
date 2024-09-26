#!/bin/bash

# Verzeichnis mit den Wallpapern
WALLPAPER_DIR="$HOME/Pictures/Wallpapers"

# Funktion zur Auswahl eines Wallpapers mit 'feh'
select_wallpaper() {
    feh --recursive --geometry 1366x768 --scale-down --action "echo %F && exit 0" $WALLPAPER_DIR
}

# Auswahl des ersten Wallpapers
notify-send "Bitte wähle das Wallpaper für Monitor 1 aus:"
WALLPAPER1=$(select_wallpaper)

# Überprüfen, ob eine Auswahl getroffen wurde
if [ -z "$WALLPAPER1" ]; then
    notify-send "Keine Auswahl für Monitor 1 getroffen. Beende das Skript."
    exit 1
fi

# Auswahl des zweiten Wallpapers
notify-send "Bitte wähle das Wallpaper für Monitor 2 aus:"
WALLPAPER2=$(select_wallpaper)

# Überprüfen, ob eine Auswahl getroffen wurde
if [ -z "$WALLPAPER2" ]; then
    notify-send "Keine Auswahl für Monitor 2 getroffen. Beende das Skript."
    exit 1
fi

# Setze die ausgewählten Wallpaper für die Monitore
feh --bg-scale "$WALLPAPER1" --bg-scale "$WALLPAPER2"

# Wende pywal auf das erste Wallpaper an
# wal -i "$WALLPAPER2" -n

notify-send "Wallpapers und Farbschema wurden erfolgreich gesetzt."
