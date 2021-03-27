#!/bin/sh
xwallpaper --zoom "$HOME/img/wp.png" &

for m in HDMI-1 DVI-D-0; do
	MONITOR="$m" polybar -r -c "$HOME/.config/polybar/polybar.ini" main &
done

exec "${HOME%/}/.xmonad/xmonad-x86_64-linux"
