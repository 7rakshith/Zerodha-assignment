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
# Download consul for further Installation
if [ -f "consul_1.6.1_linux_amd64.zip" ]
	then
		echo "File Exists"
	else
		wget https://releases.hashicorp.com/consul/1.6.1/consul_1.6.1_linux_amd64.zip
		mv consul_1.6.1_linux_amd64.zip /root/ubuntu/consul_1.6.1_linux_amd64.zip
fi
# Check for existing file
if [ -f "playbook.yml" ]
	then
		rm playbook.yml
		cp ../playbook.yml playbook.yml
	else
		# Initialising and starting vagarant box(ubuntu)
		cp ../playbook.yml playbook.yml
fi
if [ -f "Vagrantfile" ]
	then
		rm Vagrantfile
		cp ../Vagrantfile Vagrantfile
		vagrant up --provision
	else
		# Initialising and starting vagarant box(ubuntu)
		vagrant init ubuntu/xenial64
		rm Vagrantfile
		cp ../Vagrantfile Vagrantfile
		vagrant up --provision
fi

