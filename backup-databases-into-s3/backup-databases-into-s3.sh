#!/bin/bash
# backup-databases-into-s3.sh - Create compressed dumps of the given schemas and upload them into s3
# Depends on: mysqldump bzip2 s3cmd
# Made by OSOCO

# Database connections params 
DB_USER="mysql-user"
DB_PWD="mysql-password"
DB_HOST="localhost"

# Schemas to backup (it will use also the schemas passed as script parameters) 
DB_SCHEMAS="someSchema someOtherSchema"
if [ $# -ge 1 ] ; then
    DB_SCHEMAS="$* $DB_SCHEMAS"
fi

# S3 Bucket
DUMP_S3BUCKET="my-awesome-s3-bucket"

# Tmp dir
DUMP_DIR=/tmp/dump.$$

# Commans to be used
RMDIR_CMD="/bin/rm -rf"
DBDUMP_CMD=/usr/bin/mysqldump
COMPRESS_CMD=/bin/bzip2
S3CMD_CMD=/usr/bin/s3cmd

if [ ! -d "$DUMP_DIR" ] ; then
	mkdir "$DUMP_DIR"
fi

for DB_SCHEMA in $DB_SCHEMAS ; do
        DATE=$(date +%F_%T | tr ':' '-')
        DUMP_NAME="backup-$DB_SCHEMA-$DATE"
        DUMP_FILENAME=$DUMP_DIR/$DUMP_NAME.sql

        echo "Proceeding to dump database [$DB_SCHEMA]..."
        $DBDUMP_CMD --single-transaction -u$DB_USER -p$DB_PWD -h$DB_HOST $DB_SCHEMA > $DUMP_FILENAME

        echo "Compressing dumps..."
        $COMPRESS_CMD $DUMP_FILENAME

        echo "Updating to S3..."
        $S3CMD_CMD -e put $DUMP_FILENAME".bz2" s3://$DUMP_S3BUCKET/$DUMP_NAME.sql.bz2
done

echo "Cleaning up temp files and schemas..."
$RMDIR_CMD $DUMP_DIR
