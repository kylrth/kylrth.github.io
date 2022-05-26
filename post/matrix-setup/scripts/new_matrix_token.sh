#!/bin/bash

docker run --rm --network services_default curlimages/curl:7.77.0 --no-progress-meter -X POST \
        -H "Authorization: SharedSecret <the shared secret from data/registration/config.yaml>" \
        -H "Content-Type: application/json" \
        -d '{"max_usage": 1, "expiration_date": "'$(date +%Y-%m-%d --date='7 days')'"}' \
        http://registration:5000/api/token
