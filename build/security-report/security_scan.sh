#!/bin/bash

ks_version_tag=$1
set -xe

katalonImage=katalonstudio/katalon:$ks_version_tag

npm install snyk-to-html --location=global

sudo apt-get update -qq
sudo apt-get install -y zip

echo "Scanning security severity ${katalonImage} with Trivy..."
docker pull aquasec/trivy:latest
docker run -v $(pwd):/security-report --rm aquasec/trivy:0.18.3 i --format template --template "@contrib/html.tpl" --output /security-report/security_report_trivy.html ${katalonImage}

echo "Scanning security severity ${katalonImage} with Snyk..."
yes 2>/dev/null | docker scan --login --token "8a4cc0b6-50db-40e3-8afd-f8ce97e1b12c"
echo $(yes | docker scan ${katalonImage} --json) >> security_report_snyk.json
snyk-to-html -i security_report_snyk.json -o security_report_snyk.html