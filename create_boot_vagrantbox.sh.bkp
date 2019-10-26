#!/usr/bin/env bash
# Check for virtualbox installation
if ! type "virtualbox" > /dev/null; then
            echo "INSTALLING VIRTUALBOX" 
			# as virtual box is not installed
			sudo apt install virtualbox -y
		else
			echo " Virtual Box already installed"
fi
# Check for vagrant installation
if ! type "vagrant" > /dev/null; then
            echo "INSTALLING VAGRANT" 
			# as vagrant is not installed
			sudo apt install vagrant -y
		else
			echo " vagrant already installed"
fi
# Check for existing dir
if [ -d "/root/ubuntu" ]
	then
		cd /root/ubuntu
	else		
		# creating a dedicated root directory for box and moving into it
		mkdir ubuntu
		cd ubuntu
fi
# Check for existing file
if [ -f "Vagrantfile" ]
	then
		vagrant up
	else
		# Initialising and starting vagarant box(ubuntu)
		vagrant init ubuntu/xenial64
		vagrant up
fi
