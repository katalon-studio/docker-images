#!/bin/bash

set -xe

katalonImage=python:3.4-alpine

echo "Setting things up before scanning security severity..."
mkdir -p ../report
sudo apt-get update -qq
sudo apt-get install -y zip
npm install snyk-to-html --location=global

echo "Scanning security severity with Trivy..."
docker run --rm -v "$(pwd)":/root/.cache/ aquasec/trivy:0.18.3 --format template --template "@contrib/html.tpl" -o security_report_trivy.html ${katalonImage}
mv security_report_trivy.html ../report

echo "Scanning security severity with Snyk..."
docker scan --login --token "8a4cc0b6-50db-40e3-8afd-f8ce97e1b12c" | docker scan ${katalonImage} --json | snyk-to-html -o ../report/security_report_snyk.html
mv security_report_snyk.html ../report

echo "Zipping Security reports..."
zip --password "hello from Katalon" report.zip ../report/security_report.txt