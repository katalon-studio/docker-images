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
    Google Chrome 70.0.3538.77
    Mozilla Firefox 63.0
    Katalon Studio 5.8.5

# Katalon Studio image

> The usage has been simplified since v5.8.5. Visit [here](https://github.com/katalon-studio/docker-images/tree/v5.7.1) for the old usage.

## Simple usage

Inside the test project directory, execute the following command:

```
docker run -t --rm -v "$(pwd)":/katalon/katalon/source katalonstudio/katalon katalon-execute.sh -browserType="Chrome" -retry=0 -statusDelay=15 -testSuitePath="Test Suites/TS_RegressionTest"
```

**`katalon-execute.sh`**

This command will start Katalon Studio and other necessary components. All [Katalon Studio console mode arguments](https://docs.katalon.com/display/KD/Console+Mode+Execution) are accepted *except* `-runMode`, `-reportFolder`, and `-projectPath`.

**`/katalon/katalon/source`**

`katalon-execute.sh` will look for the test project inside this directory.

**Reports**

Reports will be written to the `report` directory.

## Jenkins

If this bind mount is not used, `katalon-execute.sh` will look for the test project inside the current working directory (defined with `docker run`'s `-w` argument). The current working directory is often defined automatically by some CI tools include Jenkins (Pipeline mode).

```
docker run -t --rm -v "$(pwd)":/tmp/source -w /tmp/source katalonstudio/katalon katalon-execute.sh -browserType="Chrome" -retry=0 -statusDelay=15 -testSuitePath="Test Suites/TS_RegressionTest"
```

## CircleCI

This image is compatible with CircleCI 2.0.

## Customize the report directory

If bind mount `/katalon/katalon/report` is used, the test reports will be written to that location.

## Proxy

If you need to configure proxy for Katalon Studio please use following parameters:

| Option Name          | Value Type | Values                              | Mandatory? |
| -------------------- | ---------- | ----------------------------------- | ---------- |
| proxy.option         | Fixed      | NO_PROXY, USE_SYSTEM, MANUAL_CONFIG | YES        |
| proxy.server.type    | Fixed      | HTTP, HTTPS, or SOCKS               | YES        |
| proxy.server.address | String     | Examples: locahost, 192.168.1.221   | YES        |
| proxy.server.port    | Integer    | Examples: 8888, 8080                | YES        |
| proxy.username       | String	    | Example: MyProxyUsername            | Optional (YES if your proxy server requires authentication) |
| proxy.password       | String     | Example: MyProxyPasswordOptional    | (YES if your proxy server requires authentication) |

These proxy information will be passed to browsers executing the tests.

*Do not forget to put `--config` before the proxy configuration.* Example:

```
docker run -t --rm -v "$(pwd)":/katalon/katalon/source katalonstudio/katalon katalon-execute.sh -browserType="Chrome" -retry=0 -statusDelay=15 -testSuitePath="Test Suites/TS_RegressionTest" --config -proxy.option=MANUAL_CONFIG -proxy.server.type=HTTP -proxy.server.address=192.168.1.221 -proxy.server.port=8888
```

Please visit https://github.com/katalon-studio/docker-images-samples for samples.

# Images built by community

We also host image built by community. If you want to add one, please fire a Pull Request. For example, `katalonstudio/katalon:contrib_PR_15` refers to the image built based on #15. We do not maintain or take responsiblity for any consequence made by using these images, so please use them at your own risk.
