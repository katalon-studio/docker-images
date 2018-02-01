#!/usr/bin/env bash

set -xe

echo "Install Katalon"

version=5.3.0
package=Katalon_Studio_Linux_64-$version.tar.gz
unzipped_directory=./Katalon_Studio_Linux_64-5.3

wget -O $package http://download.katalon.com/$version/$package
tar -xvzf $package
rm $package

mv $unzipped_directory $KATALON_KATALON_INSTALL_DIR
chmod u+x $KATALON_KATALON_INSTALL_DIR/katalon

echo "Katalon Studio $version" >> $KATALON_VERSION_FILE