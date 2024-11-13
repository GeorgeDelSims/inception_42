#!/bin/bash
# echo "DB_ROOT_PWD=$(cat secrets/mysql_root_password.txt)" >> srcs/.env
# echo "DB_PWF=$(cat secrets/mysql_password.txt)" >> srcs/.env

# # Path to your .env file
# ENV_FILE=".env"

# # Read the new password values from the text files
# DB_ROOT_PWD=$(cat secrets/mysql_root_password.txt)
# DB_PWD=$(cat secrets/mysql_password.txt)

# # Use `sed` to update or replace the existing values in the .env file
# if grep -q "DB_ROOT_PWD=" "$ENV_FILE"; then
#     # If DB_ROOT_PWD already exists, replace its value
#     sed -i "s/^DB_ROOT_PWD=.*/DB_ROOT_PWD=$DB_ROOT_PWD/" "$ENV_FILE"
# else
#     # If DB_ROOT_PWD does not exist, add it to the .env file
#     echo "DB_ROOT_PWD=$DB_ROOT_PWD" >> "$ENV_FILE"
# fi

# if grep -q "DB_PWF=" "$ENV_FILE"; then
#     # If DB_PWF already exists, replace its value
#     sed -i "s/^DB_PWF=.*/DB_PWF=$DB_PWF/" "$ENV_FILE"
# else
#     # If DB_PWF does not exist, add it to the .env file
#     echo "DB_PWF=$DB_PWF" >> "$ENV_FILE"
# fi
