#!/bin/sh

if [ ! -f "$CERT_FILE" ]; then
    echo "creating self-signed certificate..."

    openssl req \
        -x509 \
        -nodes \
        -newkey rsa:4096 \
        -days "$OPENSSL_DAYS" \
        -keyout "$KEY_FILE" \
        -out "$CERT_FILE" \
        -subj "$OPENSSL_SUBJECT" \
        -quiet
fi