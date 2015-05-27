#!/bin/bash
MYSQL_USER=$1
MYSQL_PASS=$2
MYSQL_CONN="-u${MYSQL_USER} -p${MYSQL_PASS}"

echo "[Saving users and passwords]"
mysql -u ${MYSQL_USER} -p${MYSQL_PASS} -ANe"select distinct concat( \"SHOW GRANTS FOR '\",user,\"'@'\",host,\"';\" ) from user;" mysql | mysql -u ${MYSQL_USER} -p${MYSQL_PASS} | sed 's/\(GRANT .*\)/\1;/;s/^\(Grants for .*\)/## \1 ##/;/##/{x;p;x;}' > all-database-users-permissions.sql