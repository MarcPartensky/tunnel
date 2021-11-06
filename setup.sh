#!/bin/sh

if [ $1 = "install" ]; then
	for service in $(/bin/ls service/*service); do
		ln -sf $PWD/service/$service /etc/systemd/system/$service
	done
	systemctl daemon-reload
fi

if [ $1 = "start" ]; then
	if [ $# = 1]; then
		for service in $(/bin/ls service/*service); do
			systemctl start $service
			systemctl enable $service
		done
	else
		systemctl start $2
		systemctl enable $2
	fi
fi
