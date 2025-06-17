#!/bin/bash

HOSTS=("servera.lab.example.com" "serverb.lab.example.com")

for host in "${HOSTS[@]}"; do
  mkdir -p /srv/certs
  openssl req -x509 -nodes -days 365 \
    -newkey rsa:2048 \
    -keyout "/srv/certs/${host}.key" \
    -out "/srv/certs/${host}.crt" \
    -subj "/CN=${host}"
done
