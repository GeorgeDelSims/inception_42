FROM debian:bullseye

# Update package lists and install MariaDB server
RUN apt-get update && \
    apt-get install -y mariadb-server && \
    rm -rf /var/lib/apt/lists/*

# copy init.sql config launch file into container architecture 
COPY ./conf/init.sql /docker-entrypoint-initdb.d/init.sql

# expose the default MariaDB/MySQL port 
# (informs Docker that the container listens on this port)
EXPOSE 3306

# set mysqld_safe as entry pooint to start MariaDB (apparently this is recommended)
ENTRYPOINT ["mysqld_safe"]
