#!/bin/bash
cd $(dirname $0)
SRCDIR=`pwd`

echo "===> Installing dwm"
cd ./wm/dwm
sudo make install
cd $SRCDIR

echo "===> Installing st"
cd terminal/st
sudo make install
cd $SRCDIR

echo "===> Installing configuration files"
cp configs/. ~ -Ra

echo "===> Installing scripts"
cp scripts ~/.scripts -r
