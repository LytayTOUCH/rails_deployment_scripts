#!/bin/bash

#--------------------------------------
# Update Server
#--------------------------------------
echo -e "---- Update Server ----"
sudo apt-get update -y
sudo apt-get upgrade -y

#--------------------------------------
# Install Apache2
#--------------------------------------
echo -e "---- Install Apache2 ----"
sudo apt-get install apache2

#--------------------------------------
# Install MySQL
#--------------------------------------
echo -e "---- Install MySQL APT Configuration Repository ----"
wget http://dev.mysql.com/get/mysql-apt-config_0.6.0-1_all.deb
sudo dpkg -i mysql-apt-config_0.6.0-1_all.deb
sudo apt-get install mysql-server mysql-client libmysqlclient-dev libapache2-mod-auth-mysql php5-mysql -y

echo -e "---- Check MySQL Installation Status ----"
sudo service mysql restart
sudo service mysql status
echo -e "---- Remove package ----"
sudo rm mysql-apt-config_0.6.0-1_all.deb

#--------------------------------------
# Install PHP Modules
#--------------------------------------
echo -e "---- Install PHP modules ----"
sudo apt-get install php5 libapache2-mod-php5 php5-mcrypt -y

#--------------------------------------
# Check PHP Modules Service
#--------------------------------------
echo -e "---- Check PHP Modules Service ----"
sudo service apache2 restart
sudo service apache2 status
