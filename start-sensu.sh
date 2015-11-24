#!/usr/bin/env bash

source stop-sensu.sh

# docker-machine restart docker-vm
docker-compose build redis
docker-compose build rabbitmq
docker-compose build sensu
docker-compose build uchiwa
docker-compose build testcontainer
eval "$(docker-machine env docker-vm)"
docker-compose run -d --service-ports uchiwa
