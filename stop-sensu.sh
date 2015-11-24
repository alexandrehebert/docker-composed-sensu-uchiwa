#!/usr/bin/env bash

echo "removing composed container"
docker-compose stop sensu
docker-compose rm -f

containers=$(docker ps -a -q)
if [ ! -z "$containers" ]
then
    echo "stopping containers"
    docker stop $containers
    echo "remove containers"
    docker rm -f $containers
fi