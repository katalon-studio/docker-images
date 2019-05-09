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

chmod -R u+x /opt/katalonstudio/configuration/resources/drivers

echo "Katalon Studio $version" >> $KATALON_VERSION_FILE
