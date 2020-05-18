#! /bin/sh

# Output before ; is to the right, after is to the left

while true; do
	DATESTR=`date +%a\ %d\ %b\ %R:%S`
	ADDRS=`ip addr |\
	   	awk '!/127.0.0.1/&&/inet / { gsub("/"," "); print $2; }'`
	[ -z "$ADDRS" ] && ADDRS="No Internet"
	ADDRSTR=""
	for ADDR in $ADDRS; do
		ADDRSTR+="${ADDR} | "
	done
	xsetroot -name "${DATE};${ADDRSTR}"
	sleep 5
done
