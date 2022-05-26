#!/bin/bash

# Bash script to start and stop a docker-compose service.
# stolen from https://selfhostedhome.com/start-docker-compose-using-systemd-on-debian/

declare -r DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
declare -r WAIT="${DIR}/wait-for-it.sh"

start() {
    cd ${DIR}

    docker-compose up -d
    ${WAIT} --timeout=120 localhost:443
}

stop() {
    cd ${DIR}
    docker-compose stop
}

case $1 in
    start) start;;
    stop) stop;;
    "") start;;
    *) echo "Usage: ./service start|stop"
esac
