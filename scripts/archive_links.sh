#!/bin/bash

# run after pushing

set -e

ssh spaceship "
set -e
pushd services
./scripts/archivebox_site.sh
"
