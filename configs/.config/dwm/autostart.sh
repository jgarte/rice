#!/bin/sh

# xclip
xclip &

# picom
picom &

# resolution of second monitor
xrandr --output DP2 --mode 1280x1024 --left-of eDP1

# wallpaper
~/.fehbg &

# bar
# for whatever reason < /sys/class/power_supply/BAT1/capacity doesn't work, so I have to use cat :/ (works in bash and zsh, but not in dash)
if [ -d "/sys/class/power_supply/BAT1" ]; then
	while true; do
		ADDR=`ip addr | awk '!/127.0.0.1/&&/inet / { gsub("/"," "); print $2; }' | sed '1q'`
		xsetroot -name " $([ -z "$ADDR" ] && echo "No Internet" || echo "$ADDR") | $(cat /sys/class/power_supply/BAT1/capacity)% | $(cat /sys/class/power_supply/BAT1/status) | $(date +%a\ %d\ %b\ %R:%S) "
		sleep 5
	done &
else
	while true; do
		ADDR=`ip addr | awk '!/127.0.0.1/&&/inet / { gsub("/"," "); print $2; }' | sed '1q'`
		xsetroot -name " $([ -z "$ADDR" ] && echo "No Internet" || echo "$ADDR") | $(date +%a\ %d\ %b\ %R:%S) "
		sleep 5
	done &
fi
