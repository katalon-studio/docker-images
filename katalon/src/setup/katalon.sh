#!/usr/bin/env bash

set -xe

CHROMEDRIV_VERSION=2.36
GECKO_VERSION=0.20.1

echo "Install Katalon"

version=5.4.2
package=Katalon_Studio_Linux_64-$version.tar.gz
unzipped_directory=Katalon_Studio_Linux-$version

wget -O $package http://download.katalon.com/$version/$package
tar -xvzf $package -C $KATALON_KATALON_INSTALL_DIR_PARENT
ls
rm $package

mv $KATALON_KATALON_INSTALL_DIR_PARENT/$unzipped_directory $KATALON_KATALON_INSTALL_DIR
chmod u+x $KATALON_KATALON_INSTALL_DIR/katalon

wget --no-check-certificate https://github.com/mozilla/geckodriver/releases/download/v$GECKO_VERSION/geckodriver-v$GECKO_VERSION-linux64.tar.gz
tar -xzf geckodriver-v$GECKO_VERSION-linux64.tar.gz -C $KATALON_KATALON_INSTALL_DIR/configuration/resources/drivers/firefox_linux64
rm -f geckodriver-v$GECKO_VERSION-linux64.tar.gz

wget --no-check-certificate https://chromedriver.storage.googleapis.com/$CHROMEDRIV_VERSION/chromedriver_linux64.zip
apt-get install unzip
unzip -o chromedriver_linux64.zip -d $KATALON_KATALON_INSTALL_DIR/configuration/resources/drivers/chromedriver_linux64
rm -f chromedriver_linux64.zip

chmod u+x $KATALON_KATALON_INSTALL_DIR/configuration/resources/drivers/firefox_linux64/geckodriver
chmod u+x $KATALON_KATALON_INSTALL_DIR/configuration/resources/drivers/chromedriver_linux64/chromedriver

echo "Katalon Studio $version" >> $KATALON_VERSION_FILE