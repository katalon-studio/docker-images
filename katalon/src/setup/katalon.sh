#!/usr/bin/env bash

set -xe

echo "Install Katalon"

version=$KATALON_STUDIO_VERSION
directory=$version
package=Katalon_Studio_Linux_64-$version.tar.gz
unzipped_directory=Katalon_Studio_Linux_64-$version

wget -O $package https://github.com/katalon-studio/katalon-studio/releases/download/v$version/Katalon_Studio_Linux_64-$version.tar.gz
ls
tar -xvzf $package -C $KATALON_KATALON_INSTALL_DIR_PARENT
ls
rm $package

mv $KATALON_KATALON_INSTALL_DIR_PARENT/$unzipped_directory $KATALON_KATALON_INSTALL_DIR
chmod u+x $KATALON_KATALON_INSTALL_DIR/katalon

chmod -R u+x $KATALON_KATALON_INSTALL_DIR/configuration/resources/drivers

rm $KATALON_KATALON_INSTALL_DIR/configuration/resources/drivers/chromedriver_linux64/chromedriver
wget -O chromedriver_linux64.zip https://chromedriver.storage.googleapis.com/78.0.3904.11/chromedriver_linux64.zip
unzip chromedriver_linux64.zip -d $KATALON_KATALON_INSTALL_DIR/configuration/resources/drivers/chromedriver_linux64
rm chromedriver_linux64.zip

rm $KATALON_KATALON_INSTALL_DIR/configuration/resources/drivers/firefox_linux64/geckodriver
wget -O geckodriver-linux64.tar.gz https://github.com/mozilla/geckodriver/releases/download/v0.25.0/geckodriver-v0.25.0-linux64.tar.gz
tar -xvzf geckodriver-linux64.tar.gz -C $KATALON_KATALON_INSTALL_DIR/configuration/resources/drivers/firefox_linux64
rm geckodriver-linux64.tar.gz

chmod -R u+x $KATALON_KATALON_INSTALL_DIR/configuration/resources/drivers

echo "Katalon Studio $version" >> $KATALON_VERSION_FILE
