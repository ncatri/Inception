#! /bin/bash

SCRIPT_DB=script_db.sql

service mysql start

echo "
ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';
CREATE DATABASE IF NOT EXISTS ${WP_DB_NAME} DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
CREATE USER IF NOT EXISTS '${WP_DB_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';
GRANT ALL ON *.* TO '${WP_DB_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';
flush privileges;
" > $SCRIPT_DB

mysql < $SCRIPT_DB
#rm $SCRIPT_DB
touch config_done.flag 
