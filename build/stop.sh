#!/bin/bash

set -xe

docker stop $(docker ps -a -q)