FROM alpine:3.22

RUN apk update && apk add --no-cache php-fpm wget bash

EXPOSE 9000

EXPOSE 3306

COPY entrypoint/setup_wordpress.sh /usr/bin/setup_wordpress.sh
RUN chmod +x /usr/bin/setup_wordpress.sh
ENTRYPOINT ["bash", "/usr/bin/setup_wordpress.sh"]

CMD ["sleep", "infinity"]