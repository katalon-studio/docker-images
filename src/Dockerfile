FROM ubuntu:16.04

# base

# common environment variables
ARG KATALON_ROOT_DIR=/katalon
ARG KATALON_BASE_ROOT_DIR=$KATALON_ROOT_DIR/base
ENV KATALON_VERSION_FILE=$KATALON_ROOT_DIR/version

ARG KATALON_SOFTWARE_DIR=/opt

# copy scripts
RUN mkdir -p $KATALON_BASE_ROOT_DIR
WORKDIR $KATALON_BASE_ROOT_DIR

RUN apt update

RUN echo "Install tools"
RUN apt -y install apt-utils
RUN apt -y install wget
RUN apt -y install unzip
RUN apt -y install curl
RUN apt -y install gosu

RUN echo "Install JRE"
RUN apt -y install default-jre

RUN echo "Install CircleCI tools"
RUN apt -y install git
RUN apt -y install ssh
RUN apt -y install tar
RUN apt -y install gzip
RUN apt -y install ca-certificates

ENV DISPLAY=:99
ENV DISPLAY_CONFIGURATION=1024x768x24
RUN echo "Install Xvfb"
RUN apt -y install xvfb

RUN echo "Install fonts"
RUN apt -y install libfontconfig
RUN apt -y install libfreetype6
RUN apt -y install xfonts-cyrillic
RUN apt -y install xfonts-scalable
RUN apt -y install fonts-liberation
RUN apt -y install fonts-ipafont-gothic
RUN apt -y install fonts-wqy-zenhei
RUN apt -y install fonts-tlwg-loma-otf
RUN apt -y install ttf-ubuntu-font-family

RUN echo "Install Mozilla Firefox"
RUN apt -y install firefox
# Install 'pulseaudio' package to support WebRTC audio streams
RUN apt -y install pulseaudio
RUN echo "$(firefox -version)" >> $KATALON_VERSION_FILE

RUN echo "Install Google Chrome"
ARG chrome_package='google-chrome-stable_current_amd64.deb'
RUN wget -O $chrome_package  https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
RUN dpkg -i $chrome_package || apt -y -f install
RUN rm $chrome_package
RUN echo "$(google-chrome -version)" >> $KATALON_VERSION_FILE

COPY ./src/wrap_chrome_binary.sh wrap_chrome_binary.sh
RUN chmod a+x wrap_chrome_binary.sh && ./wrap_chrome_binary.sh && rm -rfv ./wrap_chrome_binary.sh

ENV GRADLE_HOME=$KATALON_SOFTWARE_DIR/gradle
ENV GRADLE_BIN=$GRADLE_HOME/bin
RUN echo "Install Gradle"
ARG gradle_version=5.4.1
ARG gradle_package=gradle-$gradle_version-bin.zip
ARG gradle_unzipped_package=gradle-$gradle_version
RUN wget https://downloads.gradle.org/distributions/gradle-$gradle_version-bin.zip
RUN ls
RUN unzip $gradle_package
RUN ls
RUN rm $gradle_package
RUN mv $gradle_unzipped_package $GRADLE_HOME
RUN ls $GRADLE_HOME
ENV PATH "$PATH:$GRADLE_BIN"

# Katalon Studio

ARG KATALON_STUDIO_VERSION

# common environment variables
ENV KATALON_KATALON_ROOT_DIR=$KATALON_ROOT_DIR/katalon
ARG KATALON_KATALON_SCRIPT_DIR=$KATALON_ROOT_DIR/scripts
ARG KATALON_KATALON_INSTALL_DIR_PARENT=$KATALON_SOFTWARE_DIR
ENV KATALON_KATALON_INSTALL_DIR=$KATALON_KATALON_INSTALL_DIR_PARENT/katalonstudio
ENV ECLIPSE_SANDBOX=1.11

# copy scripts
RUN mkdir -p $KATALON_KATALON_ROOT_DIR
WORKDIR $KATALON_KATALON_ROOT_DIR

RUN echo "Install Katalon"
ARG katalon_version=$KATALON_STUDIO_VERSION
ARG katalon_directory=$version
ARG katalon_package=Katalon_Studio_Engine_Linux_64-$katalon_version.tar.gz
ARG katalon_unzipped_directory=Katalon_Studio_Engine_Linux_64-$katalon_version
RUN wget -O $katalon_package https://github.com/katalon-studio/katalon-studio/releases/download/v$katalon_version/Katalon_Studio_Engine_Linux_64-$katalon_version.tar.gz
RUN ls
RUN tar -xvzf $katalon_package -C $KATALON_KATALON_INSTALL_DIR_PARENT
RUN ls
RUN rm $katalon_package
RUN mv $KATALON_KATALON_INSTALL_DIR_PARENT/$katalon_unzipped_directory $KATALON_KATALON_INSTALL_DIR
RUN chmod u+x $KATALON_KATALON_INSTALL_DIR/katalonc
RUN chmod -R u+x $KATALON_KATALON_INSTALL_DIR/configuration/resources/drivers
ENV PATH "$PATH:$KATALON_KATALON_INSTALL_DIR"
RUN echo "Katalon Studio $version" >> $KATALON_VERSION_FILE

RUN mkdir -p $KATALON_KATALON_SCRIPT_DIR 
WORKDIR $KATALON_KATALON_SCRIPT_DIR
COPY ./src/scripts/katalon-execute.sh katalon-execute.sh
RUN chmod a+x katalon-execute.sh
COPY ./src/scripts/katalon-notify.sh katalon-notify.sh
RUN chmod a+x katalon-notify.sh
COPY ./src/scripts/katalonc.sh katalonc.sh
RUN chmod a+x katalonc.sh

ENV PATH "$PATH:$KATALON_KATALON_SCRIPT_DIR"

RUN echo "PATH=\"$PATH\"" > /etc/environment

CMD $KATALON_KATALON_SCRIPT_DIR/katalon-notify.sh

RUN chmod -R 777 $KATALON_ROOT_DIR
RUN chmod -R 777 $KATALON_SOFTWARE_DIR

# clean up

RUN echo "Clean up"
RUN apt clean all
RUN rm -rf /var/lib/apt/lists/*
RUN cat $KATALON_VERSION_FILE

WORKDIR /

COPY ./src/entrypoint.sh /usr/local/bin/entrypoint.sh
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]