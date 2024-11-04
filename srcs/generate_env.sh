#!/bin/bash
# echo "MYSQL_ROOT_PASSWORD=$(cat secrets/mysql_root_password.txt)" >> srcs/.env
# echo "MYSQL_PASSWORD=$(cat secrets/mysql_password.txt)" >> srcs/.env

# Path to your .env file
ENV_FILE=".env"

# Read the new password values from the text files
MYSQL_ROOT_PASSWORD=$(cat secrets/mysql_root_password.txt)
MYSQL_PASSWORD=$(cat secrets/mysql_password.txt)

# Use `sed` to update or replace the existing values in the .env file
if grep -q "MYSQL_ROOT_PASSWORD=" "$ENV_FILE"; then
    # If MYSQL_ROOT_PASSWORD already exists, replace its value
    sed -i "s/^MYSQL_ROOT_PASSWORD=.*/MYSQL_ROOT_PASSWORD=$MYSQL_ROOT_PASSWORD/" "$ENV_FILE"
else
    # If MYSQL_ROOT_PASSWORD does not exist, add it to the .env file
    echo "MYSQL_ROOT_PASSWORD=$MYSQL_ROOT_PASSWORD" >> "$ENV_FILE"
fi

if grep -q "MYSQL_PASSWORD=" "$ENV_FILE"; then
    # If MYSQL_PASSWORD already exists, replace its value
    sed -i "s/^MYSQL_PASSWORD=.*/MYSQL_PASSWORD=$MYSQL_PASSWORD/" "$ENV_FILE"
else
    # If MYSQL_PASSWORD does not exist, add it to the .env file
    echo "MYSQL_PASSWORD=$MYSQL_PASSWORD" >> "$ENV_FILE"
fi
