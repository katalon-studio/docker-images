#!/usr/bin/env bash

set -xe

echo "Install TigerVNC"

package=tigervncserver_1.6.0-3ubuntu1_amd64.deb
wget -O $package https://bintray.com/artifact/download/tigervnc/stable/ubuntu-16.04LTS/amd64/tigervncserver_1.8.0-1ubuntu1_amd64.deb
dpkg -i $package || apt -y -f install
rm $package