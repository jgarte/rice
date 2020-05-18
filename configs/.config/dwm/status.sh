#! /bin/bash

# Kill all previous status scripts
for pid in `ps aux |  awk '!/grep/&&/status.sh/&&/bash/ { print $2 }'`; do
	[ "$pid" = "$$" ] || kill $pid &>/dev/null
done

# Output before ; is to the right, after is to the left

BATDIR=`find /sys/class/power_supply -name 'BAT*' | sed '1q'`

[ -z "`df -H | grep '\/home$'`" ] || HASHOME=true

while true; do
	DATESTR="📅 `date +%a\ %d\ %b\ %R:%S`"

	BATSTR=""
	[ -z "${BATDIR}" ] || {
		BATSTR="🔋 `< ${BATDIR}/capacity`% `< ${BATDIR}/status` | "
	} 

	ADDRSTR="📶"
	ADDRS=`ip addr |\
	   	awk '!/127.0.0.1/&&/inet / { gsub("/"," "); print $2; }'`
	[ -z "${ADDRS}" ] && ADDRS="No Internet"
	for ADDR in $ADDRS; do
		ADDRSTR+=" ${ADDR}"
	done

	FREESTR="💾 `free -h | awk '/Mem:/ { gsub("Gi","G"); print $3 }'` / `free -h | awk '/Mem:/ { gsub("Gi","G"); print $2 }'`"

	CPUSTR="🌀 `grep 'cpu ' /proc/stat | awk '{usage=($2+$4)*100/($2+$4+$5)} END { printf("%.0f", usage) }'`%"

	DISKSTR="📁 `df -H | awk '/ \/$/ { print $3 }'` / `df -H | awk '/ \/$/ { print $2 }'`"
	[ -z "${HASHOME}" ] || {
		DISKSTR+=" | 🏠 `df -H | awk '/ \/home$/ { print $3 }'` / `df -H | awk '/ \/home$/ { print $2 }'`"
	}

	# BATSTR is ugly to make it work if no battery is connected
	xsetroot -name " ${BATSTR}${DATESTR}; ${ADDRSTR} | ${FREESTR} | ${CPUSTR} | ${DISKSTR}"
	sleep 5
done
