#!/bin/bash
#

source ./build.prop
release_name=$RELEASE'-'$(date +%m%d%Y-%H%M%S)
service_name=$SERVICE
echo $service_name":"$release_name

docker build -t c12e/$service_name:$release_name .

echo $release_name  > $service_name.docker.tag

