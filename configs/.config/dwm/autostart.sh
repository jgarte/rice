#!/bin/sh

# xclip
xclip &

# picom
picom &

# resolution of second monitor
xrandr --output DP2 --mode 1280x1024 --left-of eDP1

# wallpaper
~/.fehbg &

bash ~/.config/dwm/status.sh &
