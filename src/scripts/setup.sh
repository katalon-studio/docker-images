#!/bin/bash

set -xe

mkdir -p $KATALON_BASE_ROOT_DIR
cd $KATALON_BASE_ROOT_DIR

apt update

#Functions
function os_dependency {
        echo "Install os dependency"
        apt install -y \
        libfreetype6=2.10* \
        xfonts-cyrillic=1:1.0* \
        xfonts-scalable=1:1.0* \
        fonts-liberation=1:1.07* \
        fonts-ipafont-gothic=00303-18ubuntu1* \
        fonts-wqy-zenhei=0.9* \
        fonts-tlwg-loma-otf=1:0.7* \
        ttf-ubuntu-font-family=1:0.83*
}

app_dependency() {
        echo "Install app dependency"
        apt install -y \
        tzdata \
        apt-utils=2.0* \
        wget=1.20* \
        unzip=6.0* \
        curl=7.68* \
        gosu=1.10* \
        openjdk-8-jdk=8u352-ga-1~20.04* \
        git=1:2.25* \
        ssh=1:8.2p1-4ubuntu0* \
        tar=1.30+dfsg-7ubuntu0.20.04* \
        gzip=1.10-0ubuntu4* \
        ca-certificates=20211016ubuntu0.20.04* \
        xvfb=2:1.20.13-1ubuntu1~20.04* 
}

build_dependency() {
        echo "Install build dependency"
        apt install -y \
        firefox \
        pulseaudio=1:13.99*
}

fix_dependency() {
        echo "Fix CVE-2022-3821"
        rm -rf /etc/apt/trusted.gpg.d/*
        apt install gnupg -y
        apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 3B4FE6ACC0B21F32
        apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 871920D1991BC93C
        apt-key adv --keyserver keyserver.ubuntu.com --recv-keys EB3E94ADBE1229CF
        apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 4EB27DB2A3B88B8B
        apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 648ACFD622F3D138
        apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 0E98404D386FA1D9
        echo "deb http://deb.debian.org/debian bullseye-backports main" >> /etc/apt/sources.list && apt-get update
        apt install -y --no-install-recommends \
        libsystemd0=251.3-1*
}
export DEBIAN_FRONTEND=noninteractive
export TZ="America/New_York"
apt install tzdata -y
app_dependency
apt install libfontconfig1=$(apt list -a libfontconfig1 | grep "libfontconfig1" | head -1 | awk '{ print $2 }') -y
os_dependency
build_dependency

# echo "Install tools"
# apt install apt-utils=$(apt list -a apt-utils | grep "2.0" | head -1 | awk '{ print $2 }') -y
# apt install wget=$(apt list -a wget | grep "1.20" | head -1 | awk '{ print $2 }') -y
# apt install unzip=$(apt list -a unzip | grep "6.0" | head -1 | awk '{ print $2 }') -y
# apt install curl=$(apt list -a curl | grep "7.68" | head -1 | awk '{ print $2 }') -y
# apt install gosu=$(apt list -a gosu | grep "1.10" | head -1 | awk '{ print $2 }') -y

# echo "Install JRE"
# apt install openjdk-8-jdk=$(apt list -a openjdk-8-jdk | grep "8u352-ga-1~20.04" | head -1 | awk '{ print $2 }') -y
# echo "Install CircleCI tools"
# apt install git=$(apt list -a git | grep "1:2.25" | head -1 | awk '{ print $2 }') -y
# apt install ssh=$(apt list -a ssh | grep "1:8.2p1-4ubuntu0" | head -1 | awk '{ print $2 }') -y
# apt install tar=$(apt list -a tar | grep "1.30+dfsg-7ubuntu0.20.04" | head -1 | awk '{ print $2 }') -y
# apt install gzip=$(apt list -a gzip | grep "1.10-0ubuntu4" | head -1 | awk '{ print $2 }') -y
# apt install ca-certificates=$(apt list -a ca-certificates | grep "20211016ubuntu0.20.04" | head -1 | awk '{ print $2 }') -y
# echo "Install Xvfb"
# apt install xvfb=$(apt list -a xvfb | grep "2:1.20.13-1ubuntu1~20.04" | head -1 | awk '{ print $2 }') -y
# echo "Install fonts"
# apt install libfontconfig1=$(apt list -a libfontconfig1 | grep "libfontconfig1" | head -1 | awk '{ print $2 }') -y
# apt install libfreetype6=$(apt list -a libfreetype6 | grep "2.10" | head -1 | awk '{ print $2 }') -y
# apt install xfonts-cyrillic=$(apt list -a xfonts-cyrillic | grep "1:1.0" | head -1 | awk '{ print $2 }') -y
# apt install xfonts-scalable=$(apt list -a xfonts-scalable | grep "1:1.0" | head -1 | awk '{ print $2 }') -y
# apt install fonts-liberation=$(apt list -a fonts-liberation | grep "1:1.07" | head -1 | awk '{ print $2 }') -y
# apt install fonts-ipafont-gothic=$(apt list -a fonts-ipafont-gothic | grep "00303-18ubuntu1" | head -1 | awk '{ print $2 }') -y
# apt install fonts-wqy-zenhei=$(apt list -a fonts-wqy-zenhei | grep "0.9" | head -1 | awk '{ print $2 }') -y
# apt install fonts-tlwg-loma-otf=$(apt list -a fonts-tlwg-loma-otf | grep "1:0.7" | head -1 | awk '{ print $2 }') -y
# apt install ttf-ubuntu-font-family=$(apt list -a ttf-ubuntu-font-family | grep "1:0.83" | head -1 | awk '{ print $2 }') -y
# echo "Install Mozilla Firefox"
# #apt install firefox=$(apt list -a firefox | grep "107.0+build2-0ubuntu0.20.04" | head -1 | awk '{ print $2 }') -y
# apt install firefox -y
# # Install 'pulseaudio' package to support WebRTC audio streams
# apt install pulseaudio=$(apt list -a pulseaudio | grep "1:13.99" | head -1 | awk '{ print $2 }') -y
echo "$(firefox -version)" >> $KATALON_VERSION_FILE

echo "Install Google Chrome"
chrome_package='google-chrome-stable_current_amd64.deb'
wget -O $chrome_package  https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
dpkg -i $chrome_package || apt -y -f install
rm $chrome_package
echo "$(google-chrome --version)" >> $KATALON_VERSION_FILE || true

./wrap_chrome_binary.sh && rm -rfv ./wrap_chrome_binary.sh

echo "Install Edge Chromium"
microsoft_edge_package='MicrosoftEdgeSetup.exe'
wget -O $microsoft_edge_package https://go.microsoft.com/fwlink?linkid=2149051
dpkg -i $microsoft_edge_package || apt -y -f install
rm $microsoft_edge_package
echo "$(microsoft-edge --version)" >> $KATALON_VERSION_FILE || true

./wrap_edge_chromium_binary.sh && rm -rfv ./wrap_edge_chromium_binary.sh

echo "Install Gradle"
gradle_version='5.4.1'
gradle_package="gradle-$gradle_version-bin.zip"
gradle_unzipped_package="gradle-$gradle_version"
wget https://downloads.gradle.org/distributions/gradle-$gradle_version-bin.zip
ls
unzip $gradle_package
ls
rm $gradle_package
mv $gradle_unzipped_package $GRADLE_HOME
ls $GRADLE_HOME

# copy scripts
mkdir -p $KATALON_KATALON_ROOT_DIR
cd $KATALON_KATALON_ROOT_DIR

echo "Install Katalon"
katalon_version="$KATALON_STUDIO_VERSION"
katalon_directory="$version"
katalon_package="Katalon_Studio_Engine_Linux_64-$katalon_version.tar.gz"
katalon_unzipped_directory="Katalon_Studio_Engine_Linux_64-$katalon_version"
wget -O $katalon_package https://download.katalon.com/$katalon_version/Katalon_Studio_Engine_Linux_64-$katalon_version.tar.gz
ls
tar -xvzf $katalon_package -C $KATALON_KATALON_INSTALL_DIR_PARENT
ls
rm $katalon_package
mv $KATALON_KATALON_INSTALL_DIR_PARENT/$katalon_unzipped_directory $KATALON_KATALON_INSTALL_DIR
chmod u+x $KATALON_KATALON_INSTALL_DIR/katalonc
chmod -R u+x $KATALON_KATALON_INSTALL_DIR/configuration/resources/drivers
echo "Katalon Studio $version" >> $KATALON_VERSION_FILE

chmod -R 777 $KATALON_ROOT_DIR
chmod -R 777 $KATALON_SOFTWARE_DIR

#Fix Dependency
fix_dependency
# clean up

echo "Clean up"
apt clean all
rm -rf /var/lib/apt/lists/*
cat $KATALON_VERSION_FILE
