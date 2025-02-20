FROM debian:bullseye

RUN apt-get update -y && apt-get install mariadb-server -y

#clean cache files
RUN rm -rf /var/lib/apt/lists/*  

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/

COPY ./tools/mariadb.sh /tmp/mariadb.sh

# Make sure the script is executable
RUN chmod +x /tmp/mariadb.sh  

CMD ["/tmp/mariadb.sh"]
