#!/bin/bash

set -xe

katalonImage=python:3.4-alpine

echo "Setting things up before scanning security severity..."
mkdir -p ../report

wget https://github.com/aquasecurity/trivy/releases/download/v0.18.3/trivy_0.18.3_Linux-64bit.deb
sudo dpkg -i trivy_0.18.3_Linux-64bit.deb

npm install snyk-to-html --location=global

sudo apt-get update -qq
sudo apt-get install -y zip

echo "Scanning security severity with Trivy..."
docker pull aquasec/trivy:latest
docker run -it -v ../report:/result --rm aquasec/trivy:latest i --format template --template "@contrib/html.tpl" --output /result/security_report_trivy.html ${katalonImage}

# echo "Scanning security severity with Snyk..."
# docker scan --login --token "8a4cc0b6-50db-40e3-8afd-f8ce97e1b12c"
# echo $(docker scan ${katalonImage} --json) > security_report_snyk.json
# snyk-to-html -i security_report_snyk.json -o ../report/security_report_snyk.html
# mv security_report_snyk.html ../report

echo "Zipping Security reports..."
zip --password "hello from Katalon" report.zip ../report/security_report_trivy.html

