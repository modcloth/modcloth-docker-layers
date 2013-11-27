#!/bin/bash

set -e

export MYSQL_UNIX_PORT="/mysql/db/mysql.sock"

if [[ "$SKIP_START_REPLICATION_FOR_MASTER" == 'no' ]] ; then
  mysql -e "CREATE USER '$SR_REPLICATION_USER'@'%' IDENTIFIED BY '$SR_REPLICATION_PASSWORD'"
  mysql -e "GRANT REPLICATION SLAVE ON *.* to '$SR_REPLICATION_USER'@'%'"
  mysql -e "FLUSH PRIVILEGES;"
fi

if [[ "$SKIP_START_REPLICATION_FOR_SLAVE" == 'no' ]] ; then
  # do base backup

  mysql -e "CHANGE MASTER TO MASTER_HOST = '$SR_MASTER_IP',
    MASTER_USER = '${SR_MASTER_REPLICATION_USER:-$SR_REPLICATION_USER}',
    MASTER_PASSWORD = '${SR_MASTER_REPLICATION_PASSWORD:-$SR_REPLICATION_PASSWORD}',
    MASTER_LOG_FILE = '$(cat /mysql/db/xtrabackup_binlog_info | awk '{ print $1 }')',
    MASTER_LOG_POSITION = '$(cat /mysql/db/xtrabackup_binlog_info | awk '{ print $2 }')';"
  mysql -e "START SLAVE;"
fi
