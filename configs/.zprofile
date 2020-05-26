export PATH=$PATH:~/.scripts/:~/.gem/ruby/*/gems:/opt/
if [ "$(tty)" = "/dev/tty1" ]; then
	startx
fi
