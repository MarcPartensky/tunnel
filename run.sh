#!/bin/sh

export AUTOSSH_LOGFILE="./mini.log"

# oauto_cache,reconnect,defer_permissions,noappledouble,nolocalcaches,no_readahead

port=7022

logs() {
	tail -f $AUTOSSH_LOGFILE
}

iautossh() {
	git clone git://git.altlinux.org/people/ldv/packages/autossh.git autossh-source
	cd autossh-source/autossh
	./configure
	make
	chmod +x autossh
	sudo make install
	cd -
}

tunnelmini() {
	autossh -f -M 7123 -NT \
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
	autossh -f -M 7124 -NT \
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

rtunnelkong() {
	autossh -f -M 0 -N \
		-o "PubkeyAuthentication=yes" \
		-o "PasswordAuthentication=no" \
		-o "ServerAliveInterval 10" \
		-o "ServerAliveCountMax 3" \
		-o ExitOnForwardFailure=yes \
		-R 7126:localhost:22 \
		-p 7022 \
		-i ~/.ssh/tunnel \
		tunnel@marcpartensky.com
	}

rtunnelplayground() {
	autossh -f -M 0 -N \
		-o "PubkeyAuthentication=yes" \
		-o "PasswordAuthentication=no" \
		-o "ServerAliveInterval 10" \
		-o "ServerAliveCountMax 3" \
		-o ExitOnForwardFailure=yes \
		-R 7129:localhost:22 \
		-p 7022 \
		-i ~/.ssh/tunnel \
		tunnel@marcpartensky.com
	}

rtunnelpickup() {
	autossh -f -M 0 -N \
		-o "PubkeyAuthentication=yes" \
		-o "PasswordAuthentication=no" \
		-o "ServerAliveInterval 10" \
		-o "ServerAliveCountMax 3" \
		-o ExitOnForwardFailure=yes \
		-R 7128:localhost:22 \
		-p 7022 \
		-i ~/.ssh/tunnel \
		tunnel@marcpartensky.com

	}

rtunneltowermcprivate() {
	autossh -f -M 0 -N \
		-o "PubkeyAuthentication=yes" \
		-o "PasswordAuthentication=no" \
		-o "ServerAliveInterval 10" \
		-o "ServerAliveCountMax 3" \
		-o ExitOnForwardFailure=yes \
		-R 7129:localhost:25565 \
		-p 7022 \
		-i ~/.ssh/tunnel \
		tunnel@marcpartensky.com
	}

rtunneltowermc() {
	autossh -f -M 0 -N \
		-o "PubkeyAuthentication=yes" \
		-o "PasswordAuthentication=no" \
		-o "ServerAliveInterval 10" \
		-o "ServerAliveCountMax 3" \
		-o ExitOnForwardFailure=yes \
		-R 7065:localhost:25565 \
		-p 7022 \
		-i ~/.ssh/tunnel \
		tunnel@marcpartensky.com
	}

tunneltowervpn() {
	autossh -f -M 0 -N \
		-o "PubkeyAuthentication=yes" \
		-o "PasswordAuthentication=no" \
		-o "ServerAliveInterval 10" \
		-o "ServerAliveCountMax 3" \
		-o ExitOnForwardFailure=yes \
		-R 1337:localhost:1337 \
		-p 7022 \
		-i ~/.ssh/tunnel \
		tunnel@marcpartensky.com
	}

rtunneltowermcprivate() {
	autossh -f -M 0 -N \
		-o "PubkeyAuthentication=yes" \
		-o "PasswordAuthentication=no" \
		-o "ServerAliveInterval 10" \
		-o "ServerAliveCountMax 3" \
		-o ExitOnForwardFailure=yes \
		-R 7129:localhost:25565 \
		-p 7022 \
		-i ~/.ssh/tunnel \
		tunnel@marcpartensky.com
	}

rtunneltowermc() {
	autossh -f -M 0 -N \
		-o "PubkeyAuthentication=yes" \
		-o "PasswordAuthentication=no" \
		-o "ServerAliveInterval 10" \
		-o "ServerAliveCountMax 3" \
		-o ExitOnForwardFailure=yes \
		-R 7065:localhost:25565 \
		-p 7022 \
		-i ~/.ssh/tunnel \
		tunnel@marcpartensky.com
	}

rtunneltowervnc() {
	autossh -f -M 0 -N \
		-o "PubkeyAuthentication=yes" \
		-o "PasswordAuthentication=no" \
		-o "ServerAliveInterval 10" \
		-o "ServerAliveCountMax 3" \
		-o ExitOnForwardFailure=yes \
		-R 7130:localhost:5901 \
		-p 7022 \
		-i ~/.ssh/tunnel \
		tunnel@marcpartensky.com
	}

tunneltowervnc() {
	autossh -f -M 0 -N \
		-o "PubkeyAuthentication=yes" \
		-o "PasswordAuthentication=no" \
		-o "ServerAliveInterval 10" \
		-o "ServerAliveCountMax 3" \
		-o ExitOnForwardFailure=yes \
		-L 7130:localhost:7130 \
		-p 7022 \
		-i ~/.ssh/tunnel \
		tunnel@marcpartensky.com
	}

rtunnelisep() {
	./autossh -f -M 0 -N \
		-R 7131:localhost:22 \
		-p 7022 \
		-i tunnel \
		tunnel@marcpartensky.com
	}

rtunnelboulimix() {
	autossh -f -M 0 -N \
		-o "PubkeyAuthentication=yes" \
		-o "PasswordAuthentication=no" \
		-o "ServerAliveInterval 10" \
		-o "ServerAliveCountMax 3" \
		-o ExitOnForwardFailure=yes \
		-R 7021:192.168.0.19:22 \
		-p 7022 \
		-i ~/.ssh/tunnel \
		tunnel@marcpartensky.com
	}


tunnelall() {
	tunnelphone
	tunneltower
	tunnelmini
	tunnelkong
}
tunnelall() {
	tunnelphone
	tunneltower
	tunnelmini
}


mountvps() {
	sshfs -o Compression=no vps:/ /Users/marcpartensky/volumes/vps
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
	sshfs tower:/ /Users/marcpartensky/volumes/tower
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
