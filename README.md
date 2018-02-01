# Introduction

This project aims at providing convenient Docker images for Katalon Studio and other frameworks with following goals:

* Images are easy to use for people with limited Docker knowledge,
* Up-to-date browser versions (Google Chrome, Mozilla Firefox) from official installation packages,
* Fully installed and configured testing frameworks and companion tools,
* Compatible with Cloud and local-based CIs.

At this moment, the following images are available:

* Core: contains Google Chrome, Mozilla Firefox, Xvfb, Java SE Runtime Environment (OpenJDK).
* Katalon Studio: used to create containers that can execute Katalon Studio tests and write reports to host's file system.

# Katalon Studio

The container started from this image will expect following environment variables:
* `KATALON_OPTS`: all Katalon Studio console mode arguments except `-runMode`, `-reportFolder`, and `-projectPath`. For more details as well as an easy way to generate all arguments please refer to [the documentation](https://docs.katalon.com/display/KD/Console+Mode+Execution).

The following bind mounts should be used:

| Container's directory     | Host's directory  | Writable? |
| ------------------------- | ----------------- | --------- |
| `/katalon/katalon/source` | project directory | No - the source code will be copied to a temporary directory inside the container, therefore no write access is needed. |
| `/katalon/katalon/report` | report directory  | Yes - Katalon Studio will write execution report to this directory. |

For example, the following script will execute a project at `/home/ubuntu/katalon-test` and write reports to `/katalon/katalon/report`.

    #!/usr/bin/env bash

    katalon_opts='-browserType="Chrome" -retry=0 -statusDelay=15 -testSuitePath="Test Suites/TS_RegressionTest"'
    docker run --rm -v /home/ubuntu/katalon-test:/katalon/katalon/source:ro -v ~/report:/katalon/katalon/report -e KATALON_OPTS="$katalon_opts" katalonstudio/katalon