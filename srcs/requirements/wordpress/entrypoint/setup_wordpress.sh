#!/bin/sh

set -e

if [ ! -d wp-content ]; then
	sed -i 's/memory_limit = 128M/memory_limit = 256M/' /etc/php83/php.ini
	wp core download --path="/var/www/html" --allow-root
fi

if [ ! -f wp-config.php ]; then 
	wp config create \
		--dbname="inception" \
		--dbuser="tlutz" \
		--dbpass="bayle" \
		--dbhost="mariadb" \
		--path="/var/www/html" \
		--allow-root
fi

if [ ! wp core is-installed --allow-root ]; then
	wp core install \
		--url=tlutz.42.fr \
		--title="Inception Blog" \
		--admin_user="Elrond" \
		--admin_password="fondcombe" \
		--admin_email="elrond@example.com" \
		--skip_email \
		--allow-root
fi

exec php-fpm83 -F