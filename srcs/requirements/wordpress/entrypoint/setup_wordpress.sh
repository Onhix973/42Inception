#//bin/bash

wget https://wordpress.org/latest.tar.gz
tar -xzvf latest.tar.gz
cp -r wordpress/* /var/www/html
rm -rf latest.tar.gz
rm -rf wordpress

exec "$@"