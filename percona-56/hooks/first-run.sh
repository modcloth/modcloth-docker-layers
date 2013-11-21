#!/bin/bash

if [[ -z "$SKIP_DEFAULT_FIRST_RUN" ]] ; then
  set -e

  export MYSQL_UNIX_PORT="/mysql/db/mysql.sock"
  mysql -e "CREATE DATABASE $DFR_DB_NAME"
  mysql -e "GRANT ALL ON $DFR_DB_NAME.* TO '$DFR_DB_USER'@'%' IDENTIFIED BY '$DFR_DB_PASSWORD'"
  mysql -e "GRANT ALL ON *.* TO 'root'@'localhost' IDENTIFIED BY '$DFR_ROOT_DB_PASSWORD'"
  mysql -e "FLUSH PRIVILEGES"
fi
