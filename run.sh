#!/bin/sh

# $port=7122

function tunnel {
	ssh -f -N -T 7122:marcpartensky.com:7122 root@marcpartensky.com
}

function rtunnel {
	ssh -f -N -T -R7122:localhost:7122 root@marcpartensky.com
}


atunnel() {
	autossh -f -M 0 -N -o "ServerAliveInterval 10" -o "ServerAliveCountMax 3" -o ExitOnForwardFailure=yes -L 7122:localhost:7122 root@marcpartensky.com
}

artunnel() {
	autossh -f -M 0 -N -o "ServerAliveInterval 10" -o "ServerAliveCountMax 3" -o ExitOnForwardFailure=yes -R 7122:localhost:7122 root@marcpartensky.com
}

function control {
	sudo docker run -it \
		-v /:/system \
		-p 7122:7122 \
		-t control
		marcpartensky/env
}

# tunnel
# control
