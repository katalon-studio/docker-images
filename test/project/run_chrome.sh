#!/bin/bash

set -xe

ksversion=$1
apiKey=$2

docker run -t --rm  -e LOCAL_USER_ID=`id -u $USER` -v "/$(pwd)":/katalon/katalon/source katalon katalon-execute.sh -browserType="Chrome" -retry=0 -statusDelay=15 -testSuitePath="Test Suites/TS_RegressionTest" -apiKey=${apiKey}

# docker run -t --rm  -e LOCAL_USER_ID=`id -u $USER` -v "/$(pwd)":/katalon/katalon/source katalonstudio/katalon:$ksversion katalon-execute.sh -browserType="Chrome" -retry=0 -statusDelay=15 -testSuitePath="Test Suites/TS_RegressionTest" -apiKey=${apiKey}
