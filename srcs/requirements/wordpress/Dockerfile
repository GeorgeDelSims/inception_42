FROM debian:bullseye

# Update package list and install necessary packages for PHP 7.4
RUN apt-get update && \
    apt-get install -y curl lsb-release ca-certificates apt-transport-https software-properties-common && \
    curl -sSL https://packages.sury.org/php/README.txt | bash && \
    apt-get update && \
    apt-get install -y php7.4 php7.4-fpm php7.4-mysqli php7.4-json php7.4-curl php7.4-xml php7.4-mbstring && \
    mkdir -p /run/php && \
    rm -rf /var/lib/apt/lists/*

# Copy the custom www.conf file into the container
COPY ./config/php-fpm/www.conf /etc/php/7.4/fpm/pool.d/www.conf

# Download the latest version of WordPress from the official website
RUN mkdir -p /var/www/html && \
    curl -o /wordpress.tar.gz https://wordpress.org/latest.tar.gz && \
    tar -xzvf /wordpress.tar.gz -C /var/www/html --strip-components=1 && \
    rm /wordpress.tar.gz && \
    chown -R www-data:www-data /var/www/html && \
    chmod -R 755 /var/www/html

# Copy the wp-config.php file into the container
COPY ./wp-config.php /var/www/html/wp-config.php

# Start the PHP-FPM server
CMD ["php-fpm7.4", "-F"]
