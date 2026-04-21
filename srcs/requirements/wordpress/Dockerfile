FROM alpine:3.22

RUN apk update && apk add --no-cache php83-fpm wget \
	php83 php83-phar php83-mbstring php83-mysqli php83-tokenizer php83-session \
	php83-ctype php83-gd

EXPOSE 9000

COPY --chmod=+r ./conf/wp-config-sample.php /var/www/html/wp-config.php

COPY --chmod=+r ./conf/www.conf /etc/php83/php-fpm.d/www.conf

COPY --chmod=+x entrypoint/setup_wordpress.sh /usr/bin/setup_wordpress.sh
ENTRYPOINT ["/usr/bin/setup_wordpress.sh"]
