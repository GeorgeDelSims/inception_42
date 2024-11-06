# FROM debian:bullseye

# # Update package list and install necessary packages for PHP 7.4 and WP-CLI
# RUN apt-get update && \
#     apt-get install -y curl lsb-release ca-certificates apt-transport-https software-properties-common && \
#     curl -sSL https://packages.sury.org/php/README.txt | bash && \
#     apt-get update && \
#     apt-get install -y php7.4 php7.4-fpm php7.4-mysqli php7.4-json php7.4-curl php7.4-xml php7.4-mbstring && \
#     mkdir -p /run/php && \
#     rm -rf /var/lib/apt/lists/*

# # Copy custom www.conf file into container
# COPY ./config/php-fpm/www.conf /etc/php/7.4/fpm/pool.d/www.conf

# # Install WP-CLI
# RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
#     chmod +x wp-cli.phar && \
#     mv wp-cli.phar /usr/local/bin/wp

# # Download latest version of WordPress and set permissions
# RUN mkdir -p /var/www/html && \
#     curl -o /wordpress.tar.gz https://wordpress.org/latest.tar.gz && \
#     tar -xzvf /wordpress.tar.gz -C /var/www/html --strip-components=1 && \
#     rm /wordpress.tar.gz && \
#     chown -R www-data:www-data /var/www/html && \
#     chmod -R 755 /var/www/html

# # Copy wp-config.php file into container
# COPY ./wp-config.php /var/www/html/wp-config.php

# # Copy the wait-for-db script and make it executable
# COPY wait-for-db.sh /usr/local/bin/wait-for-db.sh
# RUN chmod +x /usr/local/bin/wait-for-db.sh

# # Use WP-CLI to configure and install WordPress
# # RUN cd /var/www/html && \
# #     /usr/local/bin/wait-for-db.sh mariadb wp core install --url=localhost --title=inception --admin_user=${ADMIN_USER} --admin_password=${ADMIN_PASSWORD} --admin_email=${ADMIN_EMAIL} --allow-root

# # Start PHP-FPM
# CMD ["php-fpm7.4", "-F"]


FROM debian:bullseye

# Update package list and install necessary packages for PHP 7.4 and WP-CLI
RUN apt-get update && \
    apt-get install -y curl lsb-release ca-certificates apt-transport-https software-properties-common && \
    curl -sSL https://packages.sury.org/php/README.txt | bash && \
    apt-get update && \
    apt-get install -y php7.4 php7.4-fpm php7.4-mysqli php7.4-json php7.4-curl php7.4-xml php7.4-mbstring && \
    mkdir -p /run/php && \
    rm -rf /var/lib/apt/lists/*

# Copy custom www.conf file into container
COPY ./config/php-fpm/www.conf /etc/php/7.4/fpm/pool.d/www.conf

# Install WP-CLI
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp

# Download and set up WordPress (if not already done)
RUN mkdir -p /var/www/html && \
    curl -o /wordpress.tar.gz https://wordpress.org/latest.tar.gz && \
    tar -xzvf /wordpress.tar.gz -C /var/www/html --strip-components=1 && \
    rm /wordpress.tar.gz && \
    chown -R www-data:www-data /var/www/html && \
    chmod -R 755 /var/www/html

# Copy wp-config.php file into container
#  This copy does not seem to be working: 
COPY ./wp-config.php /var/www/html/wp-config.php



# Copy the wait-for-db script and make it executable
COPY wait-for-db.sh /usr/local/bin/wait-for-db.sh
RUN chmod +x /usr/local/bin/wait-for-db.sh

# # Use WP-CLI to configure and install WordPress after waiting for the database
# RUN cd /var/www/html && \
#     /usr/local/bin/wait-for-db.sh mariadb wp core install --url=localhost --title=inception --admin_user=admin --admin_password=admin --admin_email=admin@admin.com --allow-root

# Start PHP-FPM
CMD ["php-fpm7.4", "-F"]
