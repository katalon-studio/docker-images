# Introduction

This project provides convenient Docker images for Katalon Studio and other Selenium-based testing frameworks, with following requirements:

* Images are easy to deploy and use for people with limited Docker knowledge,
* Up-to-date browser versions (Google Chrome, Mozilla Firefox) from official installation packages,
* Testing frameworks and companion tools are fully installed and configured for common use cases,
* Compatible with Cloud and local-based CIs.

At this moment, the following images are available:

* Base: contains common software for doing Selenium testing: Google Chrome, Mozilla Firefox, Xvfb, Java SE Runtime Environment (OpenJDK).
* [Katalon Studio](https://hub.docker.com/r/katalonstudio/katalon/): used for creating containers that can execute Katalon Studio tests and write reports to host's file system.

Versions of important packages is written in `/katalon/version` (or `$KATALON_VERSION_FILE`).

    cat $KATALON_VERSION_FILE

# Katalon Studio image

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
    docker run --rm -v /home/ubuntu/katalon-test:/katalon/katalon/source:ro -v /home/ubuntu/report:/katalon/katalon/report -e KATALON_OPTS="$katalon_opts" katalonstudio/katalon

Please visit https://github.com/katalon-studio/docker-images-samples for samples.
