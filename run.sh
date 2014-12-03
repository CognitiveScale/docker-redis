#!/bin/bash
# this script is for supervisord.conf

if [ $ROLE = 'master' ]; then
    /opt/redis-2.8.17/src/redis-server

elif [ $ROLE = 'slave']; then
    /opt/redis-2.8.17/src/redis-server --slaveof $master_host $master_port

fi
