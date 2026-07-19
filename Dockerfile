FROM nginx:1.31-alpine
RUN apk add --no-cache openssl
COPY dhparam.pem /etc/nginx/dhparam.pem
COPY default.conf.template /etc/nginx/templates/default.conf.template
COPY create-certificate.sh docker-entrypoint.d/create-certificate.sh
RUN chmod +x docker-entrypoint.d/create-certificate.sh
ENV OPENSSL_SUBJECT="/C=AU/ST=Some-State/L=./O=Internet Widgits Pty Ltd/OU=./CN=." \
    OPENSSL_DAYS="365" \
    CERT_FILE="/etc/ssl/nginx.crt" \
    KEY_FILE="/etc/ssl/private/nginx.key"