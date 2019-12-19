FROM katalon-base

ARG KATALON_STUDIO_VERSION

# common environment variables
ENV KATALON_KATALON_ROOT_DIR=$KATALON_ROOT_DIR/katalon
ENV KATALON_KATALON_SCRIPT_DIR=$KATALON_ROOT_DIR/scripts
ENV KATALON_KATALON_INSTALL_DIR_PARENT=/opt
ENV KATALON_KATALON_INSTALL_DIR=$KATALON_KATALON_INSTALL_DIR_PARENT/katalonstudio
ENV ECLIPSE_SANDBOX=1.11

# copy scripts
RUN mkdir -p $KATALON_KATALON_ROOT_DIR
WORKDIR $KATALON_KATALON_ROOT_DIR

COPY ./src/katalon.sh katalon.sh && chmod a+x katalon.sh && ./katalon.sh

# clean up
WORKDIR /
RUN rm -rfv $KATALON_KATALON_ROOT_DIR && mkdir -p $KATALON_KATALON_ROOT_DIR
RUN $KATALON_CLEAN_UP_SCRIPT

RUN mkdir -p $KATALON_KATALON_SCRIPT_DIR 
WORKDIR $KATALON_BASE_ROOT_DIR
COPY ./src/scripts/katalon-execute.sh katalon-execute.sh && chmod a+x katalon-execute.sh
COPY ./src/scripts/katalon-notify.sh katalon-notify.sh && chmod a+x katalon-notify.sh

ENV PATH "$PATH:$KATALON_KATALON_SCRIPT_DIR"

WORKDIR /

CMD $KATALON_KATALON_SCRIPT_DIR/katalon-notify.sh