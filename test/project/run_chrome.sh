#!/bin/bash

set -xe

ksversion=$1
apiKey=$2

docker run -t --rm  -u $(id -u ${USER}):$(id -g ${USER}) -v "/$(pwd)":/katalon/katalon/source katalonstudio/katalon:$ksversion katalon-execute.sh -browserType="Chrome" -retry=0 -statusDelay=15 -testSuitePath="Test Suites/TS_RegressionTest" -apiKey=${apiKey}
