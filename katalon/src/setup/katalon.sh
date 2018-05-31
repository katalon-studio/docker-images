#!/usr/bin/env bash

set -xe

echo "Install Katalon"

version=5.4.2
package=Katalon_Studio_Linux_64-$version.tar.gz

wget -O $package http://download.katalon.com/$version/$package
tar -xvzf $package -C $KATALON_KATALON_INSTALL_DIR
rm $package

chmod u+x $KATALON_KATALON_INSTALL_DIR/katalon
chmod u+x $KATALON_KATALON_INSTALL_DIR/configuration/resources/drivers/chromedriver_linux64/chromedriver

echo "Katalon Studio $version" >> $KATALON_VERSION_FILE
