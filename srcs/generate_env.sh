#!/bin/bash

pwd 

# get secrets and env from hidden extra directory 
cp -r ../.extra/.secrets .
cp ../.extra/.env srcs/.

# Get the directory of the current script
SCRIPT_DIR=$(dirname "$(realpath "$0")")

# Paths to the .env file and secret files
ENV_FILE="$SCRIPT_DIR/.env"
SECRETS_DIR="$SCRIPT_DIR/../.secrets"

# Secret files
MYSQL_ROOT_PASSWORD_FILE="$SECRETS_DIR/mysql_root_password.txt"
MYSQL_PASSWORD_FILE="$SECRETS_DIR/mysql_password.txt"
ADMIN_PASSWORD_FILE="$SECRETS_DIR/admin_password.txt"
WP_USER_PASSWORD_FILE="$SECRETS_DIR/wp_user_password.txt"

# Function to update or append a variable in the .env file
update_env() {
    local VAR_NAME=$1
    local SECRET_FILE=$2

    # Check if the secret file exists
    if [ ! -f "$SECRET_FILE" ]; then
        echo "Error: Secret file '$SECRET_FILE' not found. Skipping $VAR_NAME."
        return
    fi

    # Read the value from the secret file
    local VALUE=$(cat "$SECRET_FILE" | tr -d '\r')  # Remove carriage returns

    # Check if the variable already exists in the .env file
    if grep -q "^$VAR_NAME=" "$ENV_FILE"; then
        # Replace the existing value
        sed -i "s/^$VAR_NAME=.*/$VAR_NAME=$VALUE/" "$ENV_FILE"
    else
        # Append the variable and value
        echo "$VAR_NAME=$VALUE" >> "$ENV_FILE"
    fi
}

# Update each password
update_env "MYSQL_ROOT_PASSWORD" "$MYSQL_ROOT_PASSWORD_FILE"
update_env "MYSQL_PASSWORD" "$MYSQL_PASSWORD_FILE"
update_env "ADMIN_PASSWORD" "$ADMIN_PASSWORD_FILE"
update_env "WP_USER_PASSWORD" "$WP_USER_PASSWORD_FILE"

echo "Passwords have been updated in $ENV_FILE."
