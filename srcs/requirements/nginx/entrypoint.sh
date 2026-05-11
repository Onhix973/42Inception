#!/bin/sh

set -e

openssl req -x509 -nodes -days 365 \
	-newkey rsa:2048 -keyout /etc/nginx/certs/privkey.pem \
	-out /etc/nginx/certs/cert.pem -subj "/C=FR/ST=State/L=Lyon/O=42Lyon/CN=${DOMAIN_NAME}"

sed -i -e "s/domain_name_placeholder/"${DOMAIN_NAME}"/g" /etc/nginx/nginx.conf

exec "$@"