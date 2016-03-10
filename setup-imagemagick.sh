#!/bin/bash

#--------------------------------------
# Update Server
#--------------------------------------
echo -e "---- Update Server ----"
sudo apt-get update -y
sudo apt-get install build-essential checkinstall libx11-dev libxext-dev zlib1g-dev libpng12-dev libjpeg-dev libfreetype6-dev libxml2-dev libmagickwand-dev build-dep imagemagick

echo -e "---- Download ImageMagick Package ----"
wget http://www.imagemagick.org/download/ImageMagick-6.9.3-7.tar.gz

echo -e "---- Installing ImageMagick Package ----"
tar -xzvf ImageMagick-6.9.3-7.tar.gz
cd ImageMagick-6.9.3-7
./configure
sudo checkinstall
