export PATH=$PATH:~/.scripts:~/.gem/ruby/*/gems:/opt:~/src/bin
if [ "$(tty)" = "/dev/tty1" ]; then
	startx
fi
