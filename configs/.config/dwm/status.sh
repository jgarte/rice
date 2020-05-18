#! /bin/bash

# Output before ; is to the right, after is to the left

BATDIR=`find /sys/class/power_supply -name 'BAT*' | sed '1q'`

while true; do
	DATESTR="📅 `date +%a\ %d\ %b\ %R:%S`"


	BATSTR=""
	[ -z "${BATDIR}" ] || {
		BATSTR="| 🔋 `< ${BATDIR}/capacity`% `< ${BATDIR}/status` | "
	}

	ADDRSTR="📶"
	ADDRS=`ip addr |\
	   	awk '/inet / { gsub("/"," "); print $2; }'`
	[ -z "${ADDRS}" ] && ADDRS="No Internet"
	for ADDR in $ADDRS; do
		ADDRSTR+=" ${ADDR}"
	done

	FREESTR="💾 `free -h | awk '/Mem:/ { print $3 }'` / `free -h | awk '/Mem:/ { print $2 }'`"

	DISKSTR="📁 `df -H | awk '/ \/$/ { print $3 }'` / `df -H | awk '/ \/$/ { print $2 }'`"

	# BATSTR is ugly to make it work if no battery is connected
	xsetroot -name "${BATSTR}${DATESTR}; ${ADDRSTR} | ${FREESTR} | ${DISKSTR}"
	sleep 5
done