#!/bin/bash
MYSQL_USER=$1
MYSQL_PASS=$2
MYSQL_CONN="-u${MYSQL_USER} -p${MYSQL_PASS}"
#
# Collect all database names except for
# mysql, information_schema, and performance_schema
#
SQL="SELECT schema_name FROM information_schema.schemata WHERE schema_name NOT IN"
SQL="${SQL} ('mysql','information_schema','performance_schema')"

echo "[Query raw table list...]"
DBLISTRAW=`mysql information_schema ${MYSQL_CONN} -ANe"${SQL}"`

DBLIST=""
for DB in ${DBLISTRAW} ; do DBLIST="${DBLIST} ${DB}" ; done

echo "[Dumping database tables...]"
MYSQLDUMP_OPTIONS="--routines --triggers --single-transaction"
mysqldump ${MYSQL_CONN} ${MYSQLDUMP_OPTIONS} --databases ${DBLIST} > all-dbs.sql
echo "[End.]"

echo "[Saving users and passwords]"
mysql -u ${MYSQL_USER} -p${MYSQL_PASS} -ANe"select distinct concat( \"SHOW GRANTS FOR '\",user,\"'@'\",host,\"';\" ) from user;" mysql | mysql -u ${MYSQL_USER} -p${MYSQL_PASS} | sed 's/\(GRANT .*\)/\1;/;s/^\(Grants for .*\)/## \1 ##/;/##/{x;p;x;}' > all-database-users-permissions.sql