#!/bin/bash

set -eu

CERT_PATH="/etc/letsencrypt/live/${CERT_NAME}"
_OPTS="-n --expand --agree-tos -m ${EMAIL} --cert-name ${CERT_NAME}"

if [[ ! -d /etc/letsencrypt/accounts ]]; then
  certbot register -m "${EMAIL}" --no-eff-email --agree-tos
fi

conc() {
  cat "${CERT_PATH}/fullchain.pem" "${CERT_PATH}/privkey.pem" > "${CERT_PATH}/${CERT_NAME}.pem"
  echo -e "\nYour HAProxy-ready certificate can be found here : ${CERT_PATH}/${CERT_NAME}.pem\n"
}

ovh() {
  certbot certonly \
    ${_OPTS} \
    --dns-ovh \
    --dns-ovh-credentials /root/dns.ini \
    ${CERT_OPTS}
    conc
}

gandi() {
  certbot certonly \
    ${_OPTS} \
    -a certbot-plugin-gandi:dns \
    --certbot-plugin-gandi:dns-credentials /root/dns.ini \
    ${CERT_OPTS}
    conc
}

cloudflare() {
  certbot certonly \
    ${_OPTS} \
    --dns-cloudflare \
    --dns-cloudflare-credentials /root/dns.ini \
    ${CERT_OPTS}
    conc
}

digitalocean() {
  certbot certonly \
    ${_OPTS} \
    --dns-digitalocean \
    --dns-digitalocean-credentials /root/dns.ini \
    ${CERT_OPTS}
    conc
}

google() {
  certbot certonly \
    ${_OPTS} \
    --dns-google \
    --dns-google-credentials /root/dns.ini \
    ${CERT_OPTS}
    conc
}

linode() {
  certbot certonly \
    ${_OPTS} \
    --dns-linode \
    --dns-linode-credentials /root/dns.ini \
    ${CERT_OPTS}
    conc
}

"${@}"
