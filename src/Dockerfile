FROM katalonstudio/ubuntu-20.04:7b930cb-amd64

# common environment variables
ARG KATALON_ROOT_DIR=/katalon
ARG KATALON_BASE_ROOT_DIR=$KATALON_ROOT_DIR/base
ENV KATALON_VERSION_FILE=$KATALON_ROOT_DIR/version
ENV KATALON_SOFTWARE_DIR=/opt

ARG KATALON_KATALON_SCRIPT_DIR=$KATALON_ROOT_DIR/scripts
ENV PATH "$PATH:$KATALON_KATALON_SCRIPT_DIR"

ENV KATALON_KATALON_ROOT_DIR=$KATALON_ROOT_DIR/katalon

ARG KATALON_KATALON_INSTALL_DIR_PARENT=$KATALON_SOFTWARE_DIR
ENV KATALON_KATALON_INSTALL_DIR=$KATALON_KATALON_INSTALL_DIR_PARENT/katalonstudio
ENV PATH "$PATH:$KATALON_KATALON_INSTALL_DIR"

ENV ECLIPSE_SANDBOX='1.11'

ENV DISPLAY=':99'
ENV DISPLAY_CONFIGURATION='1024x768x24'

ENV GRADLE_HOME=$KATALON_SOFTWARE_DIR/gradle
ENV GRADLE_BIN=$GRADLE_HOME/bin
ENV PATH="$PATH:$GRADLE_BIN"

ARG KATALON_STUDIO_VERSION

# RUN mkdir -p $KATALON_KATALON_SCRIPT_DIR 
WORKDIR $KATALON_KATALON_SCRIPT_DIR

COPY ./src/scripts/setup.sh setup_katalon.sh
RUN chmod a+x setup_katalon.sh

# Main setup
RUN $KATALON_KATALON_SCRIPT_DIR/setup_katalon.sh

# Set locale
ENV LANG C.UTF-8

COPY ./src/scripts/katalon-execute.sh katalon-execute.sh
RUN chmod a+x katalon-execute.sh
COPY ./src/scripts/katalon-notify.sh katalon-notify.sh
RUN chmod a+x katalon-notify.sh
COPY ./src/scripts/katalonc.sh katalonc.sh
RUN chmod a+x katalonc.sh

RUN echo "PATH=\"$PATH\"" > /etc/environment

CMD $KATALON_KATALON_SCRIPT_DIR/katalon-notify.sh

WORKDIR /

COPY ./src/entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod a+x /usr/local/bin/entrypoint.sh
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
