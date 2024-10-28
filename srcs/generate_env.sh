#!/bin/bash

echo "DB_ROOT_PASSWORD=$(cat ../secrets/db_root_password.txt)" >> .env
echo "DB_PASSWORD=$(cat ../secrets/db_password.txt)" >> .env

