#!/bin/sh
cd "$(dirname $0)"
SRCDIR=$PWD

which dash || {
	echo "You don't seem to have dash installed, my scripts wont work. Either install dash or rewrite the top row of each script to use your preffered shell and install manually."
	exit
}

echo "===> Installing dwm"
cd ./wm/dwm || {
	echo "no wm folder?"
	exit
}

sudo make install
cd "$SRCDIR"

echo "===> Installing st"
cd ./terminal/st || {
	echo "no terminal folder?"
	exit
}

sudo make install
cd "$SRCDIR"

echo "===> Installing configuration files"
cp configs/. ~ -Raf

echo "===> Installing scripts"
cp scripts ~/.scripts -Raf
