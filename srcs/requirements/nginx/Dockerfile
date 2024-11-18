FROM debian:bullseye

#update package lists and install NGINX server
RUN apt-get update && \
    apt-get install -y nginx openssl && \
    useradd -M -s /sbin/nologin -g www-data nginx && \
    rm -rf /var/lib/apt/lists/*

# copy custom nginx configuration
COPY conf/nginx.conf /etc/nginx/ningx/conf
# COPY ./default /etc/nginx/sites_available/.

# Create SSL Directory in the container to store SSL certificates
# generate self-signed certificates using openssl (second line)
RUN mkdir -p /etc/nginx/ssl && \
    openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/nginx/ssl/gsims.key \
    -out /etc/nginx/ssl/gsims.crt \
    -subj "/CN=gsims.42.fr" && \
    echo 'fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;' >> fastcgi_params

# HTTPS PORT 
EXPOSE 443

# Set the main command to start whenever the container starts
CMD ["nginx", "-g", "daemon off;"]
