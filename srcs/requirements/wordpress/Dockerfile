FROM debian:bullseye

# Update package list and install necessary packages for PHP 7.4 and WP-CLI
RUN apt-get update && \
    apt-get install -y php7.4 php7.4-fpm php7.4-mysqli php7.4-json php7.4-curl php7.4-xml php7.4-mbstring curl && \
    rm -rf /var/lib/apt/lists/*

# Copy custom www.conf into the PHP-FPM pool configuration
COPY www.conf /etc/php/7.4/fpm/pool.d/www.conf

# RUN rm /var/www/html/wp-config.php

# copy wordpress config file into container
COPY ./wp-config.php /var/www/html/wp-config.php

# Copy the wp_install.sh script and make it executable
COPY ./wp_install.sh /usr/local/bin/wp_install.sh
RUN chmod +x /usr/local/bin/wp_install.sh

# Run the wp_install.sh script as an entrypoint
ENTRYPOINT ["/usr/local/bin/wp_install.sh"]

# # Start PHP-FPM in the foreground
# CMD ["php-fpm7.4", "-F"]
