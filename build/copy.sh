#!/bin/bash

set -xe

ksversion=$1

docker cp katalonstudio/katalon:$ksversion:/security-report/security_report_trivy.html ~/security_report_trivy.html
docker cp katalonstudio/katalon:$ksversion:/security_report_snyk.html ~/security_report_snyk.html