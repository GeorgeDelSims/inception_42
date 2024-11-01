FROM debian:bullseye

# Update package list and install necessary packages  (php-fpm = PHP FastCGI Process Manager)
RUN apt-get update && \
    apt-get install -y curl php php-fpm php-mysqli php-json php-curl php-xml php-mbstring && \
    rm -rf /var/lib/apt/lists/*

# Download (curl -o downloads file with specific filename) 
# get latest version of WordPress from official website
RUN mkdir -p /var/www/html && \
    curl -o /wordpress.tar.gz https://wordpress.org/latest.tar.gz && \
    tar -xzvf /wordpress.tar.gz -C /var/www/html --strip-components=1 && \
    rm /wordpress.tar.gz

# Copy config file into container
COPY ./wp-config.php /var/www/html/wp-config.php

# Setup permissions for Wordpress files
# chown = change ownership 
RUN chown -R www-data:www-data /var/www/html && \
    # owner has full read write and exec permissions (7) 
    # group and others only have read and execute (5) 
    chmod -R 755 /var/www/html

# Expose default port for PHP-FPM 
# (PHP FastCGI Process Manager = alternative to the traditional php interpreter)
# It is used by many web servers like nginx or apache to efficiently interpret and execute php code
EXPOSE 9000

# start the php-fpm server: php-fpm7.3
CMD ["php-fpm7.4", "-F"]