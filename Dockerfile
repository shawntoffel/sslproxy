FROM nginx:1.29-alpine
RUN apk update && apk add --no-cache openssl
COPY dhparam.pem /etc/nginx/dhparam.pem
COPY nginx.conf.template .
COPY entrypoint.sh .
RUN chmod +x entrypoint.sh
ENV OPENSSL_SUBJECT="/C=AU/ST=Some-State/L=./O=Internet Widgits Pty Ltd/OU=./CN=." \
    OPENSSL_DAYS="365" \
    CERT_FILE="/etc/ssl/nginx.crt" \
    KEY_FILE="/etc/ssl/private/nginx.key"
ENTRYPOINT [ "./entrypoint.sh" ]