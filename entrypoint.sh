#!/bin/sh

if [ ! -f "$CERT_FILE" ]; then
    echo "creating self-signed certificate..."
    openssl req -x509 -nodes -days "$OPENSSL_DAYS" -newkey rsa:4096 -keyout "$KEY_FILE" -out "$CERT_FILE" -subj "$OPENSSL_SUBJECT"
fi

echo "creating nginx.conf..."
envsubst '$NGINX_PROXY_PASS,$CERT_FILE,$KEY_FILE' < nginx.conf.template > /etc/nginx/nginx.conf

echo "starting nginx..."
exec nginx -g 'daemon off;'