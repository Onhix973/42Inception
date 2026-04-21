FROM alpine:3.22

RUN apk update && apk add --no-cache mariadb mariadb-client

COPY --chmod=+x ./init_db.sh /init_db.sh

COPY --chmod=+r ./init.sql.template /init.sql

RUN mariadb-install-db --user=mysql --datadir=/var/lib/mysql

EXPOSE 3306

ENTRYPOINT [ "/init_db.sh" ]