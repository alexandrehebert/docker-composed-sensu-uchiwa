#!/bin/sh
sudo /etc/init.d/sensu-client start
echo "run 'docker stop <container>'"
while [ true ]
do
    sleep 60
done
echo "exited $0"