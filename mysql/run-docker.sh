#!/bin/bash

chown -R mysql:mysql /var/lib/mysql

if [ "$(find /var/lib/mysql -maxdepth 0 -empty -exec echo 'EMPTY' \;)" = "EMPTY" ]
then
    mysqld --initialize-insecure --user=mysql --init-file=/initdb.sql
fi

mysqld --console

# /usr/bin/supervisord -n -c /etc/supervisor/supervisord.conf
