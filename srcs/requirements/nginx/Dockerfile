FROM alpine:3.22

RUN apk update && apk upgrade && apk add --no-cache nginx openssl

RUN mkdir -p /etc/nginx/certs

COPY nginx.conf /etc/nginx/nginx.conf
COPY --chmod=+x ./entrypoint.sh /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]

CMD nginx -g 'daemon off;'