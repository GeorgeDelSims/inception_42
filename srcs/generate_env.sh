#!/bin/bash

# echo "DB_ROOT_PASSWORD=$(cat ../secrets/db_root_password.txt)" >> .env
# echo "DB_PASSWORD=$(cat ../secrets/db_password.txt)" >> .env


# Path to your .env file
ENV_FILE=".env"

# Read the new password values from the text files
DB_ROOT_PASSWORD=$(cat secrets/db_root_password.txt)
DB_PASSWORD=$(cat secrets/db_password.txt)

# Use `sed` to update or replace the existing values in the .env file
if grep -q "DB_ROOT_PASSWORD=" "$ENV_FILE"; then
    # If DB_ROOT_PASSWORD already exists, replace its value
    sed -i "s/^DB_ROOT_PASSWORD=.*/DB_ROOT_PASSWORD=$DB_ROOT_PASSWORD/" "$ENV_FILE"
else
    # If DB_ROOT_PASSWORD does not exist, add it to the .env file
    echo "DB_ROOT_PASSWORD=$DB_ROOT_PASSWORD" >> "$ENV_FILE"
fi

if grep -q "DB_PASSWORD=" "$ENV_FILE"; then
    # If DB_PASSWORD already exists, replace its value
    sed -i "s/^DB_PASSWORD=.*/DB_PASSWORD=$DB_PASSWORD/" "$ENV_FILE"
else
    # If DB_PASSWORD does not exist, add it to the .env file
    echo "DB_PASSWORD=$DB_PASSWORD" >> "$ENV_FILE"
fi
