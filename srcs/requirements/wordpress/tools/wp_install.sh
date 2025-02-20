#!/bin/bash

chown -R www-data:www-data /var/www/html
chmod -R 755 /var/www/html

# Change to the web root directory
sleep 30

cd /var/www/html
pwd
rm -rf * 
# ls -la
# cd ../../../
pwd
cp ../../../wp-config.php wp-config.php
echo "copied wp-config/php into correct folder"
ls -la


# Check if wordpress is already installed or not: 
# if [ "/var/www/html/wp-config.php" ]; then
#     echo "WordPress is already installed. Skipping installation."
# else
    echo "Setting up WordPress..."

    # Download and configure WP-CLI
    curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
    chmod +x wp-cli.phar
    mv wp-cli.phar /usr/local/bin/wp

    # Ensure the correct permissions before proceeding
    chmod -R 755 /var/www/html
    chown -R www-data:www-data /var/www/html

    # Update WordPress core files to ensure no missing or outdated files
    # wp core update --allow-root || echo "WordPress core not installed yet, proceeding with fresh download"

    # Download WordPress core files
    wp core download --allow-root

    # Ensure the correct permissions after download
    chmod -R 755 /var/www/html
    chown -R www-data:www-data /var/www/html

    # Create the wp-config.php file
    # wp config create --dbname=${DB_NAME} --dbuser=${WP_USER} --dbpass=${WP_USER_PASSWORD} --dbhost=${DB_HOST} --allow-root

    # sleep infinity
    # Install WordPress
    wp core install --url=gsims.42.fr --title=inception --admin_user=${ADMIN_USER} --admin_password=${ADMIN_PASSWORD} --admin_email=${ADMIN_EMAIL} --allow-root

# fi

# Create the /run/php directory if it doesn't exist
mkdir -p /run/php
chmod 755 /run/php

# Ensure the correct permissions
chown -R www-data:www-data /run/php

# Start PHP-FPM in the foreground to keep the container running
exec php-fpm7.4 -F
