#!/usr/bin/env bash

set -xe

echo "Install Gradle"
version=5.4.1
package=gradle-$version-bin.zip
unzipped_package=gradle-$version

wget https://downloads.gradle.org/distributions/gradle-$version-bin.zip
ls
unzip $package
ls
rm $package

mv $unzipped_package $GRADLE_HOME
ls $GRADLE_HOME

mkdir -p ~/.gradle && echo "org.gradle.daemon=false" >> ~/.gradle/gradle.properties