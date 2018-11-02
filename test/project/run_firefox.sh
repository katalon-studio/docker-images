#!/usr/bin/env bash

set -xe

katalon_opts='-browserType="Firefox" -retry=0 -statusDelay=15 -testSuitePath="Test Suites/TS_RegressionTest"'

docker run --rm -v -e KATALON_OPTS="$katalon_opts" katalon-katalon