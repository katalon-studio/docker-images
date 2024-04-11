## Here you can use the base image or the image with browsers
## for testing purposes we are going to use images with browsers
## For portability environment variables can be set at runtime to reduce the number
## of layers 
FROM katalon/katalon-wbrowsers:latest
RUN apt install -y unzip && \ 
mkdir dl && cd dl && \
wget https://downloads.gradle.org/distributions/gradle-7.6.4-bin.zip && \
unzip gradle-7.6.4-bin.zip && \
mkdir /opt && mv gradle-7.6.4 /opt/gradle && rm -rf /dl 



