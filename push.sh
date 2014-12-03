#!/bin/bash
#

source ./build.prop
release_name=$(cat $SERVICE.docker.tag)
service_name=$SERVICE


docker tag c12e/$service_name:$release_name $REGISTRY/$service_name:$release_name
docker push $REGISTRY/$service_name:$release_name

