#!/bin/sh
sudo /etc/init.d/sensu-server start
sudo /etc/init.d/sensu-api start
sudo /etc/init.d/sensu-client start
echo "run 'docker stop <container>'"
while [ true ]
do
    sleep 60
done
# sudo /etc/init.d/sensu-server stop
# sudo /etc/init.d/sensu-api stop
echo "exited $0"