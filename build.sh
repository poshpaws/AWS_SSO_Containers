#!/usr/bin/env bash

zip ./aws_sso_container.xpi ./manifest.json ./containerize.js ./options.*

if [[ -n "$AMO_API_KEY" && -n "$AMO_API_SECRET" ]]; then
  web-ext sign \
    --api-key="$AMO_API_KEY" \
    --api-secret="$AMO_API_SECRET" \
    --source-dir=. \
    --artifacts-dir=./dist
fi
