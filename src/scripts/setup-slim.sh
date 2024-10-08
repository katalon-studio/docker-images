#!/bin/bash

set -xe

TARGETPLATFORM=$1

# copy scripts
mkdir -p $KATALON_KATALON_ROOT_DIR
cd $KATALON_KATALON_ROOT_DIR

echo "Install Katalon"
katalon_version=$(cut -d '-' -f 1 <<< "$KATALON_STUDIO_VERSION")
katalon_directory="$version"
katalon_package="Katalon_Studio_Engine_Linux_64-$katalon_version.tar.gz"
katalon_unzipped_directory="Katalon_Studio_Engine_Linux_64-$katalon_version"
if [ "$TARGETPLATFORM" == "linux/arm64" ]; then
    katalon_package="Katalon_Studio_Engine_Linux_arm64-$katalon_version.tar.gz"
    katalon_unzipped_directory="Katalon_Studio_Engine_Linux_arm64-$katalon_version"
fi
# general link
wget -O $katalon_package https://download.katalon.com/$KATALON_STUDIO_VERSION/$katalon_package
# beta link
# wget -O $katalon_package https://download.katalon.com/release-beta/$katalon_version/Katalon_Studio_Engine_Linux_64-$katalon_version.tar.gz
ls
tar -xvzf $katalon_package -C $KATALON_KATALON_INSTALL_DIR_PARENT
ls

# Remove webdrivermanager.jar
rm $KATALON_KATALON_INSTALL_DIR_PARENT/$katalon_unzipped_directory/configuration/resources/tools/webdriver/webdrivermanager-5.8.0-fat.jar

rm $katalon_package
mv $KATALON_KATALON_INSTALL_DIR_PARENT/$katalon_unzipped_directory $KATALON_KATALON_INSTALL_DIR
chmod u+x $KATALON_KATALON_INSTALL_DIR/katalonc
chmod -R u+x $KATALON_KATALON_INSTALL_DIR/configuration/resources/drivers
echo "Katalon Studio $version" >> $KATALON_VERSION_FILE

chmod -R 777 $KATALON_ROOT_DIR
chmod -R 777 $KATALON_KATALON_INSTALL_DIR

# clean up
apt clean all
rm -rf /var/lib/apt/lists/*
cat $KATALON_VERSION_FILE
