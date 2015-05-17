#!/bin/bash

USER="user"
PASSWORD="xxxxxx"
OUTPUT="mbackup/"
OUTPUT_FILE="mysql_dump.`date +%Y%m%d`.tgz"
SCP_HOST=scp.adrive.com
SCP_USER=xxxxxx

rm -rf $OUTPUT*

databases=`mysql -u $USER -p$PASSWORD -e "SHOW DATABASES;" | tr -d "| " | grep -v Database`

for db in $databases; do
    if [[ "$db" != "information_schema" ]] && [[ "$db" != "performance_schema" ]] && [[ "$db" != "mysql" ]] && [[ "$db" != _* ]] ; then
        echo "Dumping database: $db"
        mysqldump -u $USER -p$PASSWORD --databases $db > $OUTPUT`date +%Y%m%d`.$db.sql
    fi
done

tar -cvzpf $OUTPUT_FILE $OUTPUT

scp -i ~/.ssh/adrive_key $OUTPUT_FILE $SCP_USER@$SCP_HOST:mysql-backup


