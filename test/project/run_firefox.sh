#!/usr/bin/env bash

set -xe

docker run -t --rm -v "$(pwd)":/katalon/katalon/source katalonstudio/katalon:test katalon-execute.sh -browserType="Firefox" -retry=0 -statusDelay=15 -testSuitePath="Test Suites/TS_RegressionTest"