FROM alpine:3.22

RUN apk update && apk add --no-cache mariadb mariadb-client

COPY --chmod=+x ./init_db.sh /init_db.sh

COPY --chmod=+r ./init.sql.template /init.sql
COPY --chmod=+x ./my.cnf /etc/my.cnf

RUN mariadb-install-db --user=mysql --datadir=/var/lib/mysql --socket=/tmp/mysql.sock

EXPOSE 3306

ENTRYPOINT [ "/init_db.sh" ]

CMD mariadbd --datadir=/var/lib/mysql --init-file=/init.sql --bind-address=0.0.0.0 --user=mysql --socket=/tmp/mysql.sock
