#!/usr/bin/env bash

WALLDIR="$HOME/Pictures/wallpapers"

pgrep hyprpaper >/dev/null || hyprpaper &

sleep 0.2

WALL=$(find "$WALLDIR" -type f | shuf -n 1)

hyprctl hyprpaper unload all
hyprctl hyprpaper preload "$WALL"
hyprctl hyprpaper wallpaper ",$WALL"
