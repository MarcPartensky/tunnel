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
	sudo make install
	cd -
}

tunnelmini() {
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

rtunnelmini() {
	autossh -f -M 7124 -N \
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

tunneltower() {
	autossh -f -M 7125 -N \
		-o "PubkeyAuthentication=yes" \
		-o "PasswordAuthentication=no" \
		-o "ServerAliveInterval 10" \
		-o "ServerAliveCountMax 3" \
		-o ExitOnForwardFailure=yes \
		-L 7121:localhost:7121 \
		-p 7022 \
		-i ~/.ssh/tunnel \
		tunnel@marcpartensky.com
	}

rtunneltower() {
	autossh -f -M 0 -N \
		-o "PubkeyAuthentication=yes" \
		-o "PasswordAuthentication=no" \
		-o "ServerAliveInterval 10" \
		-o "ServerAliveCountMax 3" \
		-o ExitOnForwardFailure=yes \
		-R 7121:localhost:22 \
		-p 7022 \
		-i ~/.ssh/tunnel \
		tunnel@marcpartensky.com
	}

tunnelphone() {
	autossh -f -M 7127 -N \
		-o "PubkeyAuthentication=yes" \
		-o "PasswordAuthentication=no" \
		-o "ServerAliveInterval 10" \
		-o "ServerAliveCountMax 3" \
		-o ExitOnForwardFailure=yes \
		-L 7110:localhost:7110 \
		-p 7022 \
		-i ~/.ssh/tunnel \
		tunnel@marcpartensky.com
	}

rtunnelphone() {
	autossh -f -M 0 -N \
		-o "PubkeyAuthentication=yes" \
		-o "PasswordAuthentication=no" \
		-o "ServerAliveInterval 10" \
		-o "ServerAliveCountMax 3" \
		-o ExitOnForwardFailure=yes \
		-R 7110:localhost:8022 \
		-p 7022 \
		-i ~/.ssh/tunnel \
		tunnel@marcpartensky.com
	}


mountvps() {
	sshfs root@marcpartensky.com:/ -p 7022 /Users/marcpartensky/volumes/vps
}

umountvps() {
	umount /Users/marcpartensky/volumes/vps
}

mountmini() {
	sshfs marc@localhost:/ -p 7122 /Users/marcpartensky/volumes/mini
}

umountmini() {
	umount /Users/marcpartensky/volumes/mini
}

mounttower() {
	sshfs marc@localhost:/ -p 7121 /Users/marcpartensky/volumes/tower
}

umounttower() {
	umount /Users/marcpartensky/volumes/tower
}

mountphone() {
	sshfs marc@localhost:. -p 7110 /Users/marcpartensky/volumes/phone
}

umountphone() {
	umount /Users/marcpartensky/volumes/phone
}

umountall() {
	rm .DS_Store
	umount /Users/marcpartensky/volumes/*
}

mountall() {
	mountphone
	mountvps
	mounttower
}

remountall() {
	rm .DS_Store
	umount /Users/marcpartensky/volumes/*
	mountphone
	mountvps
	mounttower
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
