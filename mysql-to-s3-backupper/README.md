backup-databases-into-s3
================================

Description
-------------------------

Generic script to upload one or more mysql schemas (even all that are available for the given user) to a S3 bucket.

Dependencies
-------------------------

  * mysqldump
  * mysql
  * tar
  * s3cmd

Usage
-------------------------

Mandatory switches:

  * -b s3_bucket_and_path: the S3 bucket followed by an optional path
  * -u the mysql user
  * -p the password for the given mysql user

Optional switches:

  * -s a mysql schema to backup. Can be multi-valuated. If none provided, all the schemas will be backed up

Example:

$ backup-mysql-db-to-s3.sh -b s3://myAwesomeBucket/a/cool/path -u mysqlUser -p superSecretPassword -s aMysqlSchema -s anotherMysqlSchema 
