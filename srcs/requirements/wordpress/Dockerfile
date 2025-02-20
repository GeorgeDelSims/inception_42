FROM debian:bullseye

# RUN cd ../../volumes/wordpress_data && rm -rf *

# Install necessary packages
RUN apt-get update && \
    apt-get install -y php7.4 php7.4-fpm php7.4-mysqli php7.4-json php7.4-curl php7.4-xml php7.4-mbstring curl && \
    apt-get update && apt-get install -y default-mysql-client && \
    rm -rf /var/lib/apt/lists/*

# Copy custom www.conf into the PHP-FPM pool configuration
COPY conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf

# Prepare /var/www/html directory
RUN mkdir -p /var/www/html && \
    chown -R www-data:www-data /var/www/html && \
    chmod -R 755 /var/www/html

# Copy WordPress config to the correct location
COPY conf/wp-config.php /wp-config.php
RUN chown www-data:www-data /wp-config.php && \
    chmod 644 /wp-config.php

# Copy the wp_install.sh script and make it executable
COPY tools/wp_install.sh /usr/local/bin/wp_install.sh
RUN chmod +x /usr/local/bin/wp_install.sh

# Run the wp_install.sh script as an entrypoint
ENTRYPOINT ["/usr/local/bin/wp_install.sh"]
