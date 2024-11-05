#!/bin/bash

# Check if the MariaDB data directory exists (indicating the database is not initialized)
echo "beginning of mariadb.sh script"

if [ -d "/var/lib/mysql/wordpress" ]; then
    echo "MariaDB data directory already initialized."
    
    exec mysqld --user=mysql

else
    echo "Initializing MariaDB data directory..."
    # Initialize the MariaDB data directory
    mysql_install_db --user=mysql --datadir=/var/lib/mysql

    echo "Starting MariaDB temporarily to set up the database..."
    # Start MariaDB temporarily in the background
    mysqld --user=mysql --skip-networking &
    # Wait for MariaDB to start
    sleep 5

    echo "Running initialization SQL script..."
    # Run the SQL script to create the database and user
    mysql -u root < /etc/mysql/init.sql

    # Kill the temporary MariaDB server
    echo "Stopping the temporary MariaDB server..."
    mysqladmin -u root shutdown
fi

echo "end of mariadb.sh script"

# Start MariaDB in the foreground

# initialises the MYSQL data directory and creates necessary system tables
# It prepares the MySQL environment for first-time use by creating directories and files where MySQL will store data
# mysql_install_db 

# The following command starts the MySQL server (the MySQL daemon) by calling its executable. 
# When this command runs, the MySQL server starts and becomes ready to accept connections, 
# handle queries, and manage the databases.
# mysqld

# Mariadb script
# if !mysqldb
    # create it
    # mysql.install.db
    # fill db1sql
    # mysqld
    # mysql < db1sql
    #  kill
# if mysqldb
    # exec mysqldb
