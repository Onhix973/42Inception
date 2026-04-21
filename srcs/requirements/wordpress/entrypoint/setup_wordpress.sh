#!/bin/sh

wget https://wordpress.org/latest.tar.gz
tar -xzvf latest.tar.gz
cp -r wordpress/* /var/www/html
rm -rf latest.tar.gz
rm -rf wordpress

sed -i -e "s/MYSQL_NAME_PH/$(cat /run/secrets/mysql_name)/g" /var/www/html/wp-config.php
sed -i -e "s/MYSQL_USER_PH/$(cat /run/secrets/mysql_user)/g"  /var/www/html/wp-config.php
sed -i -e "s/MYSQL_PASSWORD_PH/$(cat /run/secrets/mysql_password)/g" /var/www/html/wp-config.php

exec php-fpm83 -F -R