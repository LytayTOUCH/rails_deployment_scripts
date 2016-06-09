#!/bin/bash

#--------------------------------------
# Update Server
#--------------------------------------
echo -e "---- Update Server ----"
sudo apt-get update -y
sudo apt-get install build-essential checkinstall libx11-dev libxext-dev zlib1g-dev libpng12-dev libjpeg-dev libfreetype6-dev libxml2-dev libmagickwand-dev -y

echo -e "---- Download ImageMagick Package ----"
IMAGEMAGICK_VERSION="7.0.1-9"
wget http://www.imagemagick.org/download/ImageMagick-$IMAGEMAGICK_VERSION.tar.gz
echo -e "---- Installing ImageMagick Package ----"
tar -xzvf ImageMagick-$IMAGEMAGICK_VERSION.tar.gz
cd ImageMagick-$IMAGEMAGICK_VERSION
./configure
sudo checkinstall
# Fixing convert: error while loading shared libraries: libMagickCore-7.Q16HDRI.so.0: cannot open shared object file: No such file or directory
# sudo /sbin/ldconfig /usr/local/lib
