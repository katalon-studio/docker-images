#!/usr/bin/env bash

set -xe

katalon_opts='-browserType="Chrome" -retry=0 -statusDelay=15 -testSuitePath="Test Suites/TS_RegressionTest"'

docker run --rm -e KATALON_OPTS="$katalon_opts" -v .:/katalon/katalon/source katalon-katalon katalon-execute.sh