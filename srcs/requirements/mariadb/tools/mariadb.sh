#!/bin/sh

# Ensure required directories exist with proper permissions
mkdir -p /run/mysqld /var/lib/mysql
chown -R mysql:mysql /run/mysqld /var/lib/mysql
chmod 777 /run/mysqld /var/lib/mysql

# Initialize database if it doesn't exist
if [ ! -d "/var/lib/mysql/mysql" ]; then
    echo "Initializing MariaDB data directory..."
    # mysqld --initialize-insecure --user=mysql --datadir=/var/lib/mysql
    # mysqld-install-db --user=mysql --datadir=/var/lib/mysql
    mysql_install_db --user=mysql --datadir=/var/lib/mysql

fi

# Start MySQL server in the background
echo "Starting MariaDB..."
# mysqld --datadir=/var/lib/mysql --user=mysql --skip-networking &
mysqld --datadir=/var/lib/mysql --skip-networking &
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

-- Create 'gsims' for both '%' (TCP/IP) and 'gsims.42.fr' (Unix sockets)
CREATE USER IF NOT EXISTS '$MYSQL_USER'@'wordpress.srcs_inception' IDENTIFIED BY '$MYSQL_PASSWORD';
CREATE USER IF NOT EXISTS '$MYSQL_USER'@'gsims.42.fr' IDENTIFIED BY '$MYSQL_PASSWORD';

-- Grant privileges to 'gsims' for both '%' and 'localhost'
GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'wordpress.srcs_inception';
GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'gsims.42.fr';

-- Allow 'root' to connect from both '%' (TCP/IP) and 'localhost' (Unix sockets)
-- ALTER USER 'root'@'gsims.42.fr' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';
-- CREATE USER IF NOT EXISTS 'root'@'%' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';
-- GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' WITH GRANT OPTION;

-- Apply changes
FLUSH PRIVILEGES;

EOF

# Stop the MySQL server (in order to restart it cleanly with all configs sorted)
echo "Stopping MariaDB after initialization..."
kill $pid
wait $pid

# Start the MySQL server in the foreground
exec mysqld --datadir=/var/lib/mysql --user=mysql || {
    echo "MariaDB failed to start in production mode."
    exit 1
}

# exec mariadbd-safe --datadir=/var/lib/mysql --user=mysql

# GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_ROOT_USER'@'%' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';
