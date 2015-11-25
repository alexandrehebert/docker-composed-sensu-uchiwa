#!/usr/bin/env bash

if [ $# -lt 1 ]; then
        echo "Usage: sh start-sensu.sh <docker-machine-name>"
        exit 0
fi

eval "$(docker-machine env $1)"

source stop-sensu.sh

# docker-machine restart docker-vm
docker-compose build redis rabbitmq sensu uchiwa testcontainer
docker-compose run -d --service-ports uchiwa
