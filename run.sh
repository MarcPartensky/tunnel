#!/bin/sh

export AUTOSSH_LOGFILE="./mini.log"

# $port=7122

logs() {
	tail -f $AUTOSSH_LOGFILE
}

iautossh() {
	tar xvf autossh-1.4g.tgz
	cd autossh-1.4g
	./configure
	make
	chmod +x autossh
	mv /autossh /usr/local/bin
	cd -
}

tunnel() {
	autossh -f -M 7123 -N \
		-o "PubkeyAuthentication=yes" \
		-o "PasswordAuthentication=no" \
		-o "ServerAliveInterval 10" \
		-o "ServerAliveCountMax 3" \
		-o ExitOnForwardFailure=yes \
		-L 7122:localhost:7122 \
		-p 7022 \
		-i ~/.ssh/tunnel \
		tunnel@marcpartensky.com
}

rtunnel() {
	autossh -f -M 7123 -N \
		-o "PubkeyAuthentication=yes" \
		-o "PasswordAuthentication=no" \
		-o "ServerAliveInterval 10" \
		-o "ServerAliveCountMax 3" \
		-o ExitOnForwardFailure=yes \
		-R 7122:localhost:22 \
		-p 7022 \
		-i ~/.ssh/tunnel \
		tunnel@marcpartensky.com
}

control() {
	sudo docker run -it \
		-v /:/system \
		-p 7122:7122 \
		-t control
		marcpartensky/env
}

# tunnel
# control
