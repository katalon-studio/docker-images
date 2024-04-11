#=======================================================
#  Building base Docker Image based on Debian Slim
#  The build is originally from the golden image repo with some 
#  optimizations 
#  Run these commands to make a base docker image. 
#  $ make base-studio-image 
#  $ make image-with-browsers 
#  $ make image-with-gradle - Makes image with Gradle no environment variables set
#  $ make clean - removes images from your local build machine 
#  $ make scan-base - scans base image
#  $ make scan-browers - scans browser image
#  $ make scan-gradle - scans gradle image 
#  $ make clean-tools - removes gradle image scanner 
#=======================================================

# Build base studio image 
base-studio-image: 
	cd base/; docker build -t katalon/katalon-base:latest . 

# Build Browser Image. Ensure base image is present or at least committed to Dockerhub
# Have to update with wrap_edge_chromium_binary.sh and wrap_chrome_binary.sh 
image-with-browsers: 
	cd browsers/; docker build -t katalon/katalon-wbrowsers:latest .  

image-with-gradle: 
	cd gradle/; docker build -t katalon/katalon-studio-gradle:latest .

scan-base: 
	docker run --rm \
	--volume /var/run/docker.sock:/var/run/docker.sock \
	--name Grype anchore/grype:latest katalon/katalon-base:latest

scan-browsers: 
	docker run --rm \
	--volume /var/run/docker.sock:/var/run/docker.sock \
	--name Grype anchore/grype:latest katalon/katalon-wbrowsers:latest

scan-gradle: 
	docker run --rm \
	--volume /var/run/docker.sock:/var/run/docker.sock \
	--name Grype anchore/grype:latest katalon/katalon-studio-gradle:latest

clean:
	docker rmi katalon/katalon-base:latest
	docker rmi katalon/katalon-wbrowsers:latest
	docker rmi katalon/katalon-studio-gradle:latest

clean-tools:
	docker rmi anchore/grype:latest