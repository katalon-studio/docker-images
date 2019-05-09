#!/usr/bin/env bash

set -xe

ksversion=$1

current_dir=$(pwd)
project_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
reports_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )/.." && pwd )/reports/chrome"

rm -rfv "$reports_dir"
mkdir -p "$reports_dir"

docker run -t --rm -v "$project_dir":/katalon/katalon/source -v "$reports_dir":/katalon/katalon/report katalonstudio/katalon:$ksversion katalon-execute.sh -browserType="Chrome" -retry=0 -statusDelay=15 -testSuitePath="Test Suites/TS_RegressionTest"

cd $current_dir