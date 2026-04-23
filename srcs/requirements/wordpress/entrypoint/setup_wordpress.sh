#!/bin/sh

set -e

if [ ! -d wp-content ]; then
	sed -i 's/memory_limit = 128M/memory_limit = 256M/' /etc/php83/php.ini
	wp core download --path="/var/www/html" --allow-root
fi

until mariadb -h mariadb -P 3306 -u tlutz -pbayle -e "SELECT 1" >/dev/null 2>&1; do
  echo "Waiting for MariaDB..."
  sleep 2
done

if [ ! -f wp-config.php ]; then 
	wp config create \
		--dbname="$(cat /run/secrets/mysql_name)" \
		--dbuser="$(cat /run/secrets/mysql_user)" \
		--dbpass="$(cat /run/secrets/mysql_password)" \
		--dbhost="mariadb:3306" \
		--path="/var/www/html" \
		--allow-root
fi

wp core install \
	--url=tlutz.42.fr \
	--title="Inception Blog" \
	--admin_user="Elrond" \
	--admin_password="fondcombe" \
	--admin_email="elrond@example.com" \
	--skip-email \
	--allow-root

exec "$@"