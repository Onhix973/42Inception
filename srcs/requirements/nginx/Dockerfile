FROM alpine:3.22

RUN apk update && apk upgrade && apk add --no-cache nginx openssl

RUN mkdir -p /etc/nginx/certs
RUN openssl req -x509 -nodes -days 365 \
	-newkey rsa:2048 -keyout /etc/nginx/certs/privkey.pem \
	-out /etc/nginx/certs/cert.pem -subj "/C=FR/ST=State/L=Lyon/O=42Lyon/CN=tlutz.42.fr"

COPY nginx.conf /etc/nginx/nginx.conf
RUN sed -i -e "s/domain_name_placeholder/'${DOMAIN_NAME}'/g" /etc/nginx/nginx.conf

CMD nginx -g 'daemon off;'