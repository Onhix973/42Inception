FROM alpine:3.21

RUN apk update && apk upgrade && apk add --no-cache nginx openssl gettext

COPY nginx.conf.template /etc/nginx/templates/nginx.conf.template

CMD ["/bin/sh", "-c", "envsubst < /etc/nginx/templates/nginx.conf.template > /etc/nginx/nginx.conf && nginx -g 'daemon off;'"]
