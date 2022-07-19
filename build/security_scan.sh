#!/bin/bash

set -xe

katalonImage=python:3.4-alpine

echo "Setting things up before scanning security severity..."
mkdir -p ../report
npm install snyk-to-html -g
sudo apt-get update -qq
sudo apt-get install -y zip

echo "Scanning security severity with Trivy..."
echo $(docker run --rm -v "$(pwd)":/root/.cache/ aquasec/trivy:0.18.3 ${katalonImage}) >> ../report/security_report_trivy.txt

echo "Scanning security severity with Snyk..."
docker scan --login --token "8a4cc0b6-50db-40e3-8afd-f8ce97e1b12c" | docker scan ${katalonImage} --json | snyk-to-html -o ../report/security_report_snyk.html

echo "Zipping Security reports..."
zip --password "hello from Katalon" report.zip ../report/security_report.txt