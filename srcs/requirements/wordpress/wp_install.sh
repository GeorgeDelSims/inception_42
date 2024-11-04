#!/bin/bash

# Change to the web root directory
cd /var/www/html

# Download and configure WP-CLI
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

# Download WordPress core files
wp core download --allow-root

# Create the wp-config.php file
wp config create --dbname=wordpress --dbuser=wpuser --dbpass=password --dbhost=mariadb --allow-root

# Install WordPress
wp core install --url=localhost --title=inception --admin_user=admin --admin_password=admin --admin_email=admin@admin.com --allow-root

# Start PHP-FPM in the foreground to keep the container running
php-fpm7.4 -F
