FROM alpine:3.21

RUN apk update && apk upgrade && apk add nginx

CMD ["nginx", "-g", "daemon off;"]