#! /bin/sh

SCRDIR=`dirname $0`
cd $SRCDIR

echo "Installing dwm"
cd "wm/dwm"
sudo make install
cd $SRCDIR

echo "Installing st"
cd "terminal/st"
sudo make install
cd $SRCDIR

echo "Installing configuration files"
cp "configs/.*" "~"

echo "Installing etc files"
sudo cp "etc/*" "/etc"

echo "Installing scripts"
cp "scripts" "~/.scripts"
