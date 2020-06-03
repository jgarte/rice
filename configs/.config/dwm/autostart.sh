#! /bin/dash

# status bar
[ -f "$HOME/.config/dwm/status.sh" ] && "$HOME"/.config/dwm/status.sh &

# xclip
xclip &

# picom
picom &

# wallpaper
"$HOME"/.fehbg &
