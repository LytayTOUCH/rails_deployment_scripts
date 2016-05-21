#!/bin/bash

# Author: LytayTOUCH, CLCAM-V28DEC2015
#-------------------------------------
# Setup Ruby on Rails Environment
#-------------------------------------
# Usage
# Run script: change file mode into execution
# Command: $ sudo chmod +x setup-ROR.sh

# Setup command
# Command: $ ./setup-ROR.sh

#--------------------------------------
# Update Server
#--------------------------------------
echo -e "---- Update Server ----"
sudo apt-get update -y
sudo apt-get upgrade -y

#--------------------------------------
# Install neccessary dependencies packages
#--------------------------------------
echo -e "---- Install Neccessary Dependencies Packages Into Server ----"
sudo apt-get install git-core curl zlib1g-dev libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties libffi-dev -y

#-----------------------------------------
# Install Latest Git
#-----------------------------------------
echo -e "---- Install Latest Git Into Server ----"
sudo add-apt-repository ppa:git-core/ppa -y
sudo apt-get update -y
sudo apt-get install git -y

#-----------------------------------------
# Install RVM with Ruby v2.2.3 & Rails v4.2.6
#-----------------------------------------
RUBY_VERSION="2.3.1"
echo -e "---- Install RVM with Ruby v2.3.0 & Rails Framework Into Server ----"
sudo apt-get install libgdbm-dev libncurses5-dev automake libtool bison libffi-dev -y
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 -y
curl -sSL https://rvm.io/mpapis.asc | gpg --import -
curl -L https://get.rvm.io | bash -s stable
source ~/.rvm/scripts/rvm
echo -e "---- Install Ruby Packages $RUBY_VERSION ----"
rvm install $RUBY_VERSION
source ~/.rvm/scripts/rvm
echo -e "---- Set Ruby $RUBY_VERSION as Default ----"
rvm use $RUBY_VERSION --default
echo -e "---- Disable Download RDoc of Rails Package ----"
echo "gem: --no-ri --no-rdoc" > ~/.gemrc

RAILS_VERSION="4.2.6"
echo -e "---- Show Gem List ----"
gem list
echo -e "---- Install Rails Framework $RAILS_VERSION ----"
gem install rails -v $RAILS_VERSION
echo -e "---- Install Neccessary Gems For Production and Development Mode ----"
gem install therubyracer prawn barby byebug libv8 rspec rspec-rails guard-rspec flog flay rubocop guard-rubocop quiet_assets better_errors pdf-reader pdfkit wicked_pdf rmagick

#-----------------------------------------
# Update all packages dependencies
#-----------------------------------------
echo -e "---- Update All Packages Dependencies Into Server ----"
sudo apt-get dist-upgrade -y
source ~/.profile
