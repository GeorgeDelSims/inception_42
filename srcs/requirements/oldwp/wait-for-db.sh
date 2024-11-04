#!/bin/bash
# wait-for-db.sh

host="$1"
shift
cmd="$@"

until mysql -h "$host" -u "$MYSQL_USER" -p"$MYSQL_PASSWORD" -e "SHOW DATABASES;" > /dev/null 2>&1; do
    echo "Waiting for database connection..."
    sleep 5
done

echo "Database connection established!"
exec $cmd
