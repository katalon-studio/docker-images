#!/bin/bash

set -xe

ksversion=$1

docker cp katalon:/security-report/security_report_trivy.html ~/security_report_trivy.html
docker cp katalon:/security_report_snyk.html ~/security_report_snyk.html