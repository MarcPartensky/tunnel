#!/bin/sh

for service in $(/bin/ls service/*service); do
	ln -sf $PWD/service/$service /etc/systemd/system/$service
done

systemctl daemon-reload

for service in $(/bin/ls service/*service); do
	systemctl start $service
	systemctl enable $service
done
