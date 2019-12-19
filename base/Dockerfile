FROM ubuntu:18.04

# This is to avoid the error
# 'debconf: unable to initialize frontend: Dialog'
ENV DEBIAN_FRONTEND noninteractive

# common environment variables
ENV KATALON_ROOT_DIR=/katalon
ENV KATALON_BASE_ROOT_DIR=/katalon/base
ENV KATALON_VERSION_FILE=/katalon/version

# copy scripts
RUN mkdir -p $KATALON_BASE_ROOT_DIR
WORKDIR $KATALON_BASE_ROOT_DIR

COPY ./src/tools.sh tools.sh
RUN chmod a+x tools.sh && ./tools.sh

COPY ./src/jre.sh jre.sh
RUN chmod a+x jre.sh && ./jre.sh
COPY ./src/circleci.sh circleci.sh
RUN chmod a+x circleci.sh && ./circleci.sh

ENV DISPLAY=:99
ENV DISPLAY_CONFIGURATION=1024x768x24
COPY ./src/xvfb.sh xvfb.sh
RUN chmod a+x xvfb.sh && ./xvfb.sh
COPY ./src/fonts.sh fonts.sh
RUN chmod a+x fonts.sh && ./fonts.sh

COPY ./src/firefox.sh firefox.sh
RUN chmod a+x firefox.sh && ./firefox.sh
COPY ./src/chrome.sh chrome.sh
RUN chmod a+x chrome.sh && ./chrome.sh

ENV GRADLE_HOME=/opt/gradle
ENV GRADLE_BIN=$GRADLE_HOME/bin
COPY ./src/gradle.sh gradle.sh
RUN chmod a+x gradle.sh && ./gradle.sh

# clean up
WORKDIR /
RUN rm -rfv $KATALON_BASE_ROOT_DIR && mkdir -p $KATALON_BASE_ROOT_DIR
ENV KATALON_CLEAN_UP_SCRIPT=$KATALON_BASE_ROOT_DIR/cleanup.sh
COPY ./src/clean.sh $KATALON_CLEAN_UP_SCRIPT
RUN chmod a+x $KATALON_CLEAN_UP_SCRIPT && $KATALON_CLEAN_UP_SCRIPT

ENV PATH "$PATH:$GRADLE_BIN"

WORKDIR /

COPY ./src/entrypoint.sh /usr/local/bin/entrypoint.sh
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]