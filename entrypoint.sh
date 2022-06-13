#!/bin/sh
echo "creating self-signed certificate..."
openssl req -x509 -nodes -newkey rsa:4096 -keyout /etc/ssl/private/nginx.key -out /etc/ssl/nginx.crt -subj "$OPENSSL_SUBJECT"

echo "creating nginx.conf..."
envsubst '$NGINX_PROXY_PASS' < nginx.conf.template > /etc/nginx/nginx.conf

echo "starting nginx..."
exec nginx -g 'daemon off;'