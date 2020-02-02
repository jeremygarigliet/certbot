#!/bin/ash

certbot certonly \
  --manual \
  --agree-tos \
  -m "${EMAIL}" \
  --manual-public-ip-logging-ok \
  --preferred-challenges dns-01 \
  --server https://acme-v02.api.letsencrypt.org/directory \
  -d "${1}"
if [ "$?" -ne "0" ]; then exit 1; fi

DOMAIN=$(echo "${1}" | cut -d '.' -f 2,3)

cat /etc/letsencrypt/archive/${DOMAIN}/fullchain1.pem /etc/letsencrypt/archive/${DOMAIN}/privkey1.pem > /etc/letsencrypt/archive/${DOMAIN}/${DOMAIN}.pem