# Katalon Studio Docker Image

This project provides convenient Docker images for Katalon Studio which contains up-to-date browsers (Google Chrome, Mozilla Firefox) from official installation packages,

Versions of important packages is written in `/katalon/version` (or `$KATALON_VERSION_FILE`).

```
docker run -t --rm katalonstudio/katalon cat /katalon/version
```

## Companion products

### Katalon TestOps

[Katalon TestOps](https://analytics.katalon.com) is a web-based application that provides dynamic perspectives and an insightful look at your automation testing data. You can leverage your automation testing data by transforming and visualizing your data; analyzing test results; seamlessly integrating with such tools as Katalon Studio and Jira; maximizing the testing capacity with remote execution.

* Read our [documentation](https://docs.katalon.com/katalon-analytics/docs/overview.html).
* Ask a question on [Forum](https://forum.katalon.com/categories/katalon-analytics).
* Request a new feature on [GitHub](CONTRIBUTING.md).
* Vote for [Popular Feature Requests](https://github.com/katalon-analytics/katalon-analytics/issues?q=is%3Aopen+is%3Aissue+label%3Afeature-request+sort%3Areactions-%2B1-desc).
* File a bug in [GitHub Issues](https://github.com/katalon-analytics/katalon-analytics/issues).

## Sample configurations

Please visit https://github.com/katalon-studio-samples/ci-samples for a sample project with configurations for some CI tools.

## Usage

> The usage has been simplified since v5.8.5. Visit [here](https://github.com/katalon-studio/docker-images/tree/v5.7.1) for the old usage.

> The usage has been simplified further since v7.2.1.

### (Since v7.2.1) Simple use case

Inside the test project directory, execute the following command:

```
docker run -t --rm -v "$(pwd)":/tmp/project katalonstudio/katalon katalonc.sh -projectPath=/tmp/project -browserType="Chrome" -retry=0 -statusDelay=15 -testSuitePath="Test Suites/TS_RegressionTest"
```

You can also run the test under the current user ID using the environment variable `KATALON_USER_ID`. This will help avoid permission issues when accessing artifacts generated after the test execution.

```
docker run -t --rm -e KATALON_USER_ID=`id -u $USER` -v "$(pwd)":/tmp/project katalonstudio/katalon katalonc.sh -projectPath=/tmp/project -browserType="Chrome" -retry=0 -statusDelay=15 -testSuitePath="Test Suites/TS_RegressionTest"
```

**`katalonc.sh`**

This command will start Katalon Studio and other necessary components. All [Katalon Studio console mode arguments](https://docs.katalon.com/display/KD/Console+Mode+Execution) are accepted *except* `-runMode`.

### (Pre v7.2.1) Simple use case

<details><summary><strong>Deprecated</strong></summary>
<p>

Inside the test project directory, execute the following command:

```
docker run -t --rm -v "$(pwd)":/katalon/katalon/source katalonstudio/katalon katalon-execute.sh -browserType="Chrome" -retry=0 -statusDelay=15 -testSuitePath="Test Suites/TS_RegressionTest"
```

**`katalon-execute.sh`**

This command will start Katalon Studio and other necessary components. All [Katalon Studio console mode arguments](https://docs.katalon.com/display/KD/Console+Mode+Execution) are accepted *except* `-runMode`, `-reportFolder`, and `-projectPath`.

**`/katalon/katalon/source`**

`katalon-execute.sh` will look for the test project inside this directory.

If this bind mount is not used, `katalon-execute.sh` will look for the test project inside the current working directory (defined with `docker run`'s `-w` argument)..

```
docker run -t --rm -v "$(pwd)":/tmp/source -w /tmp/source katalonstudio/katalon katalon-execute.sh -browserType="Chrome" -retry=0 -statusDelay=15 -testSuitePath="Test Suites/TS_RegressionTest"
```

**Reports**

Reports will be written to the `report` directory.

> **Docker Toolbox for Windows**
>
> Please make sure directories have been shared and configured correctly https://docs.docker.com/toolbox/toolbox_install_windows/#optional-add-shared-directories.

If bind mount `/katalon/katalon/report` is used, the test reports will be written to that location on the host machine.

</p>
</details>

### Display configuration

This image makes use of Xvfb with the following configurations which are configurable with `docker run`:

```
ENV DISPLAY=:99
ENV DISPLAY_CONFIGURATION=1024x768x24
```

### Jenkins

Please see [the sample `Jenkinsfile`](https://github.com/katalon-studio-samples/ci-samples/blob/master/Jenkinsfile).

### CircleCI

This image is compatible with CircleCI 2.0. Please see [the sample `config.yml`](https://github.com/katalon-studio-samples/ci-samples/blob/master/.circleci/config.yml).

### Proxy

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
docker run -t --rm -v "$(pwd)":/katalon/katalon/source katalonstudio/katalon katalonc.sh -projectPath=/katalon/katalon/source -browserType="Chrome" -retry=0 -statusDelay=15 -testSuitePath="Test Suites/TS_RegressionTest" --config -proxy.option=MANUAL_CONFIG -proxy.server.type=HTTP -proxy.server.address=192.168.1.221 -proxy.server.port=8888
```

## Build custom images

The Katalon Runtime Engine's `katalonc` and its companion script `katalonc.sh` were added to `$PATH`. You can make use of these files to build custom images.
