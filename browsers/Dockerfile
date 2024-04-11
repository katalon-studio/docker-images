FROM katalon/katalon-base:latest
 
RUN apt -y install firefox &&\
    wget -O MicrosoftEdgeSetup.exe https://go.microsoft.com/fwlink?linkid=2149051 &&\
    dpkg -i MicrosoftEdgeSetup.exe || apt -y -f install &&\
	wget -O google-chrome-stable_current_amd64.deb https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb &&\
    dpkg -i google-chrome-stable_current_amd64.deb || apt -y -f install &&\
    rm -f google-chrome-stable_current_amd64.deb &&\
    apt remove -y --purge xdg-utils libjxl-dev libxml2 libopenjp2-7 libjxl0.7 libgdk-pixbuf2.0-common\
    libavahi-client3 libavahi-common-data libavahi-common3