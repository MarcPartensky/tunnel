#!/bin/sh

ln -sf $PWD/service $HOME/.config/systemd/user

# if [ $1 = "install" ]; then
# 	cd service
# 	for service in $(/bin/ls *service); do
# 		echo $service
# 		ln -sf $PWD/$service /etc/systemd/system/$service
# 	done
# 	systemctl daemon-reload
# 	cd -
# fi

# if [ $1 = "start" ]; then
# 	if [ $# = 1]; then
# 		cd service
# 		for service in $(/bin/ls service/*service); do
# 			systemctl start $service
# 			systemctl enable $service
# 		done
# 		cd -
# 	else
# 		systemctl start $2
# 		systemctl enable $2
# 	fi
# fi
