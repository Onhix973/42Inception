#!/bin/sh

set -e

if [ ! -d wp-content ]; then
	sed -i 's/memory_limit = 128M/memory_limit = 256M/' /etc/php83/php.ini
	wp core download --path="/var/www/html" --allow-root
fi

until mariadb -h mariadb -P 3306 -u "$(cat /run/secrets/mysql_user)" -p"$(cat /run/secrets/mysql_password)" -e "SELECT 1" >/dev/null 2>&1; do
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

	wp core install \
		--url=https://tlutz.42.fr \
		--title="Inception" \
		--admin_user="$(cat /run/secrets/wp_admin)" \
		--admin_password="$(cat /run/secrets/wp_admin_password)" \
		--admin_email="admin@example.com" \
		--skip-email \
		--allow-root \
		--path=/var/www/html

	wp user create $(cat /run/secrets/wp_user) user@example.com\
		--role=author \
		--user_pass=$(cat /run/secrets/wp_user_password) \
		--path=/var/www/html

fi

exec "$@"