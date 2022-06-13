FROM nginx:1.22.0-alpine
RUN apk add --no-cache openssl
COPY dhparam.pem /etc/nginx/dhparam.pem
COPY nginx.conf.template .
COPY entrypoint.sh .
RUN chmod +x entrypoint.sh
ENV OPENSSL_SUBJECT="/C=AU/ST=Some-State/L=./O=Internet Widgits Pty Ltd/OU=./CN=."
ENTRYPOINT [ "./entrypoint.sh" ]