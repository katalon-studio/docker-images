FROM linuxcontainers/debian-slim:latest

### update the image and add required packages 
### Debian ships with many of the fonts listed in the Ubuntu image
### They aren't listed here because they are already installed
RUN echo "deb http://ftp.us.debian.org/debian sid main non-free" >/etc/apt/sources.list && \
    apt update -y && apt upgrade -y && \
    apt install -y apt-utils wget unzip curl\
    openjdk-17-jdk xfonts-cyrillic xfonts-scalable\
    fonts-liberation fonts-ipafont-gothic\
    fonts-wqy-zenhei fonts-tlwg-loma-otf fonts-ubuntu pulseaudio\
    libgdk-pixbuf-2.0-0 xvfb psmisc &&\  
    # Remove unecessary packages Double check for accuracy
    apt -y autoremove --purge libgdk-pixbuf-2.0-0 libsndfile1 libldap-common make libldap-2.5-0\
           libxml2 libopenjp2-7 libjxl0.7 libgdk-pixbuf2.0-common libldap-common\
           libexpat1 libgdk-pixbuf-2.0-0:amd64 
                   