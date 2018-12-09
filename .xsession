#!/usr/bin/env bash

setxkbmap us -option compose:ralt -option ctrl:nocaps

# fix dwm java bad behavior
wmname LG3D

# Put your wallpapers at ~/.wallpapers, they will be randomized on each session
WALLPAPERS="$HOME/.wallpapers"

if [ -d "$WALLPAPERS" ] && type feh &> /dev/null; then
    # Use feh to display dwm backgrounds
    feh --randomize --bg-fill ~/.wallpapers/* &> /dev/null
fi
xrandr --output VGA1 --auto --primary --output HDMI1 --auto --right-of VGA1

# This applies for ThinkPad laptops
xinput set-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation" 1
xinput set-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation Button" 2
xinput set-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation Timeout" 200
xinput set-button-map 11 1 2 3 5 4 6 7 8 9 10 11 12

if type conky &> /dev/null; then
    conky | while read REPLY; do xsetroot -name "$REPLY"; done &
fi
exec dwm

