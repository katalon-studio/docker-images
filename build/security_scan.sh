#!/bin/bash

set -xe

katalonImage=katalonstudio/katalon:test-sec

echo "Setting things up before scanning security severity..."
mkdir -p ../report

npm install snyk-to-html --location=global

sudo apt-get update -qq
sudo apt-get install -y zip

echo "Scanning security severity with Trivy..."
docker pull aquasec/trivy:latest
docker run -v $(pwd):/result --rm aquasec/trivy:0.18.3 i --format template --template "@contrib/html.tpl" --output /result/security_report_trivy.html ${katalonImage}
mv security_report_trivy.html ../report

echo "Scanning security severity with Snyk..."
yes 2>/dev/null | docker scan --login --token "8a4cc0b6-50db-40e3-8afd-f8ce97e1b12c"
echo $(yes | docker scan ${katalonImage} --json) >> security_report_snyk.json
snyk-to-html -i security_report_snyk.json -o security_report_snyk.html
mv security_report_snyk.html ../report

echo "Zipping Security reports..."
zip --password "Katalian@2022" report.zip ../report/security_report_trivy.html ../report/security_report_snyk.html

# echo $(docker scan --token "8a4cc0b6-50db-40e3-8afd-f8ce97e1b12c" katalonstudio/katalon:test --json) >> security_report_snyk.json | snyk-to-html -o security_report_snyk.html