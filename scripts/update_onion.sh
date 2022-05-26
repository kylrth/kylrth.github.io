#!/bin/bash

set -e

ssh spaceship "
set -e
pushd services
./scripts/torservice_pull.sh
"
