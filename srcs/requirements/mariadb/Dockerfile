FROM debian:bullseye

# Update package lists and install MariaDB server
RUN apt-get update && \
    apt-get install -y mariadb-server && \
    echo "mariadb server installed" && \
    rm -rf /var/lib/apt/lists/*

# copy the modified 50-server.cnf file into container
COPY 50-server.cnf /etc/mysql/mariadb.conf.d/.

# change ownership for 50-server.cnf file 
RUN chown -R mysql:mysql /etc/mysql/mariadb.conf.d/50-server.cnf && \
    chmod 755 /etc/mysql/mariadb.conf.d/50-server.cnf

# copy init.sql config launch file into container 
COPY ./conf/init.sql /etc/mysql/init.sql

RUN chmod +x /etc/mysql/init.sql

COPY mariadb_script.sh .

RUN mkdir /run/mysqld && chown -R mysql:mysql /run/mysqld && chmod +x mariadb_script.sh

# set mysqld_safe as entry point to start MariaDB (apparently this is recommended)
CMD ["./mariadb_script.sh"]
