#!/bin/sh

# $port=7122

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
	ssh -f -N -T \
		-L 7122:marcpartensky.com:7122 \
		root@marcpartensky.com
}

rtunnel() {
	ssh -f -N -T \
		-R 7122:localhost:7122 \
		root@marcpartensky.com
}


atunnel() {
	autossh -f -M 7123 -N \
		-o "PubkeyAuthentication=yes" \
		-o "PasswordAuthentication=no" \
		-o "ServerAliveInterval 10" \
		-o "ServerAliveCountMax 3" \
		-o ExitOnForwardFailure=yes \
		-L 7122:localhost:7122 \
		root@marcpartensky.com -p 7022
}

artunnel() {
	autossh -f -M 7123 -N \
		-o "PubkeyAuthentication=yes" \
		-o "PasswordAuthentication=no" \
		-o "ServerAliveInterval 10" \
		-o "ServerAliveCountMax 3" \
		-o ExitOnForwardFailure=yes \
		-R 7122:localhost:22 \
			root@marcpartensky.com -p 7022
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
