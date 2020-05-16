export PATH=$PATH:/sbin/:/snap/bin/:~/.scripts/:~/.gem/ruby/2.6.0/gems:/opt/
if [ "$(tty)" = "/dev/tty1" ]; then
	sh ~/.scripts/login_script
fi
