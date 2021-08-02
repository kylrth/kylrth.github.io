#!/bin/bash

set -e

echo "Don't forget you can do 'host -t txt _acme-challenge.kylrth.com'."
docker-compose run --rm certbot certonly \
    --manual --preferred-challenges=dns \
    -w /var/www/certbot \
    --email name@example.com \
    -d '*.kylrth.com' --rsa-key-size 4096 --agree-tos --force-renewal
