#!/bin/sh
# rm -rf /var/lib/mysql
# if [ ! -d "/run/mysqld" ]; then

    mkdir -p /run/mysqld
    chmod 777 /run/mysqld
    chown -R mysql:mysql /run/mysqld #to ensure proper ownership
# fi

echo "la DB existe putain" 
chmod 777 /var/lib/mysql
chown -R mysql:mysql /var/lib/mysql
echo " blablb lab $DB_NAME "

if [ ! -d "/var/lib/mysql/$DB_NAME" ]; then
    mkdir -p /var/lib/mysql
    chmod 777 /var/lib/mysql
    chown -R mysql:mysql /var/lib/mysql
    echo "ALLEEEEEEEEEZ LAAAAAAAAAAAAAAA"
    # service mariadb start

    mysql_install_db --datadir=/var/lib/mysql --user=mysql  #initialize the data directory

    echo "CREATE DATABASE IF NOT EXISTS $DB_NAME ;" > db1.sql #populate the database with sql commands
    echo "CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_PWD' ;" >> db1.sql
    echo "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%';" >> db1.sql
    echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '$DB_ROOT_PWD' ;" >> db1.sql
    echo "FLUSH PRIVILEGES;" >> db1.sql

    mysqld --datadir=/var/lib/mysql --user=mysql &
    sleep 5
    mysql < db1.sql
    sleep 3
    kill $(cat /run/mysqld/mysqld.pid)
fi
sleep 3

exec mysqld --datadir=/var/lib/mysql --user=mysql
