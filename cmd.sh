#!/bin/bash

docker build -t ith/certbot .

docker run \
  -ti \
  -v $(pwd)/ssl:/etc/letsencrypt/archive \
  -e EMAIL="email@address.here" \
  ith/certbot "domain.com"
  