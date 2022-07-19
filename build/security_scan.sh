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
trivy image --format template --template trivy_html.tpl -o security_report_trivy.html ${katalonImage}
mv security_report_trivy.html ../report

echo "Scanning security severity with Snyk..."
docker scan --token "8a4cc0b6-50db-40e3-8afd-f8ce97e1b12c" ${katalonImage} --json | snyk-to-html -o ../report/security_report_snyk.html
mv security_report_snyk.html ../report

echo "Zipping Security reports..."
zip --password "hello from Katalon" report.zip ../report/security_report.txt