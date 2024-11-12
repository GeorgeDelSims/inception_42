#!/bin/sh

# Ensure required directories exist with proper permissions
mkdir -p /run/mysqld /var/lib/mysql
chown -R mysql:mysql /run/mysqld /var/lib/mysql
chmod 777 /run/mysqld /var/lib/mysql

# Initialize database if it doesn't exist
if [ ! -d "/var/lib/mysql/mysql" ]; then
    echo "Initializing MariaDB data directory..."
    # mysqld --initialize-insecure --user=mysql --datadir=/var/lib/mysql
    mariadb-install-db --user=mysql --datadir=/var/lib/mysql
fi

# Start MySQL server in the background
echo "Starting MariaDB..."
# mysqld --datadir=/var/lib/mysql --user=mysql --skip-networking &
mariadbd-safe --datadir=/var/lib/mysql --skip-networking &
pid=$!

# MariaDB is Started Temporarily:
# the script starts MariaDB (mysqld --skip-networking) to create the database and user (gsims) 
# and to grant privileges. This is common practice because the database must be running 
# for these SQL commands to execute.

# MariaDB is Stopped and Restarted:
# After initialization, MariaDB is shut down to apply configuration changes, 
# clear temporary settings, and start cleanly with networking enabled for production.

# Wait for the server to fully start
sleep 5

# Create database and user if not exists
echo "Setting up the database and user..."
echo "Hello user $MYSQL_USER and password $MYSQL_ROOT_PASSWORD "

cat <<EOF | mariadb -u root --password="$MYSQL_ROOT_PASSWORD"
CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;
CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';
GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';
ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';
FLUSH PRIVILEGES;
EOF

# Stop the MySQL server
echo "Stopping MariaDB after initialization..."
kill $pid
wait $pid

# Start the MySQL server in the foreground
exec mysqld --datadir=/var/lib/mysql --user=mysql

# GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_ROOT_USER'@'%' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';