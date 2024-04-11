
# Environment for base images

This pattern is used to decouple packages Docker image builds. Its purpose is to identify and
reduce the number of vulnerabilities found in the packages. NOTE: This is just a base template
To add to CI/CD Pipelines parameters need to be added to the makefile

* * *

## Instructions

* Tool Requirements:
  * gnumake or make
  * Docker runtime installed
* To build a base image (makefile should be located in the parent directory)
  * $ make base-studio-image
  * $ make image-with-browsers
  * $ make image-with-gradle - Makes image with Gradle no environment variables set
  * $ make clean - removes images from your local build machine
  * $ make scan-base - scans base image
  * $ make scan-browsers - scans browser image
  * $ make scan-gradle - scans gradle image
  * $ make clean-tools - removes grype image scanner

* * *

* directory Layout

|-- README.md
|-- base
|   `-- Dockerfile
|-- browsers
|`-- Dockerfile
|-- gradle
|   `-- Dockerfile
`-- makefile

* base directory builds a base image. To change the image name go into the makefile target
This is solely a template and can be modified accordingly.

* browers directory builds on the base image and installs all browsers for KSO

* gradle directory builds on browsers and installs gradle to /opt.
No environment variables are set so the image can be used in different environments.
environment variables can be set at runtime. The gradle image has some High CVE that have available fixes. The Docker/or make files can be edited to apply the fixes.

* * *

### Local scanning

The tool used for scanning is docker image anchore/grype from the anchore project.

    * make scan-base - will scan a base image and provide the results

    * make scan-browsers - will scan the image with browsers and provide the results 

    * make scan-gradle - will scan the gradle image and provide the results 

Results can redirected to a file if necessary:

    * make scan-gradle > file.txt (For file output)

* * *

### Clean up once images are pushed

    To remove grype 

    * make clean-tools 

    To remove locally built Katalon images 

    * make clean

Note:

Push to Docker Hub will be added once this environment is test.

Please refer questions to Angel Rosario <angel.rosario@katalon.com>