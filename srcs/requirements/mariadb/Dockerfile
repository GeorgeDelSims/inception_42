FROM debian:bullseye

# Update package lists and install MariaDB server
RUN apt-get update && \
    apt-get install -y mariadb-server && \
    rm -rf /var/lib/apt/lists/*

# copy init.sql config launch file into container architecture 
COPY ./conf/init.sql /docker-entrypoint-initdb.d/init.sql



# set mysqld_safe as entry pooint to start MariaDB (apparently this is recommended)
ENTRYPOINT ["mysqld_safe"]
