#!/bin/sh

sed -i -e "s/MYSQL_NAME_PH/$(cat /run/secrets/mysql_name)/g" init.sql
sed -i -e "s/MYSQL_USER_PH/$(cat /run/secrets/mysql_user)/g"  init.sql
sed -i -e "s/MYSQL_PASSWORD_PH/$(cat /run/secrets/mysql_password)/g" init.sql

mysqld --datadir=/var/lib/mysql --init-file=/init.sql --bind-address=0.0.0.0 --user=mysql