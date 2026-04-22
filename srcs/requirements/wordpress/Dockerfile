FROM alpine:3.22

RUN apk update && apk add --no-cache php83-fpm wget \
	php83 php83-phar php83-mbstring php83-mysqli php83-tokenizer php83-session \
	php83-ctype php83-gd

EXPOSE 9000

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

COPY --chmod=+r ./conf/www.conf /etc/php83/php-fpm.d/www.conf

COPY --chmod=+x entrypoint/setup_wordpress.sh /usr/bin/setup_wordpress.sh

WORKDIR /var/www/html

ENTRYPOINT ["/usr/bin/setup_wordpress.sh"]
