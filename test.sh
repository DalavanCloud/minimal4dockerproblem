#!/bin/bash

set -eu

# Wait (quarter) a minute ...
sleep 15

echo
echo "Last 10 lines of docker log"
echo "===================="
sudo tail -10 /var/log/upstart/docker.log
echo "===================="

if sudo docker ps 2>/dev/null | grep -q 'CONTAINER ID'
   then echo "Docker is up and running"
   else echo "Docker is not running!" >&2
        exit 1
fi
