##!/bin/bash

# Damian Adriel
# Deploy on server. v0.1
# Github: https://github.com/damianpv

clear
echo "Debian/Ubuntu :: Deploy with Apache."
echo "Github: https://github.com/damianpv"
echo "Twitter: https://twitter.com/damianpv"
echo ""
echo "1- Apache."
echo "========="
echo "0- Exit"
echo ""
echo "Select your web server (1-0):"

read webserver
if [ $webserver -eq "1" ]; then

	service='apache2'
	if ps ax | grep -v grep | grep $service > /dev/null 
	then
		echo "==================================="
	else
		echo "Installing Apache. Continue? [y/n]"

		read install_apache
		if [[ $install_apache == "Y" || $install_apache == "y" ]]
		then
			sudo apt-get install apache2
		fi
		echo "==================================="
	fi

	echo "Make configuration for Deploy with Apache"
	echo "* Enable Rewrite module"
	echo "* Install Python Tools"
	echo "* Install WSGI module"
	echo "* Enable WSGI module"
	echo "* Apache restart"
	echo ""
	echo "Do that? [Y/n]"

	read continue
	if [[ $continue == "Y" || $continue == "y" ]]
	then
		# Enable URL rewrite module
		sudo a2enmod rewrite

		# Install Python Tools
		sudo apt-get install python-setuptools

		# Install WSGI module for Apache
		sudo apt-get install libapache2-mod-wsgi

		# Enable URL rewrite module
		sudo a2enmod wsgi

		# Restart Apache
		sudo service apache2 restart
	else
		#echo -e "Please enter your name: "
		#read name
		#which apache2
		#echo "Nice to meet you $name"
		echo "Goodbye :)"
	fi
fi
