#!/bin/bash

# Load variables from .env file
source .env

sed -e "s/\${LIVEKIT_API_KEY}/$LIVEKIT_API_KEY/g" \
    -e "s/\${LIVEKIT_API_SECRET}/$LIVEKIT_API_SECRET/g" \
    -e "s|\${BACKEND_URL}|$BACKEND_URL|g" \
    -e "s/\${BACKEND_LIVEKIT_WEBHOOK_ID}/$BACKEND_LIVEKIT_WEBHOOK_ID/g" \
    template.livekit.config.yaml > livekit.config.yaml

sed -e "s/\${SELF_DOMAIN}/$SELF_DOMAIN/g" \
    template.nginx.custom.conf > nginx.custom.conf

docker compose up -d