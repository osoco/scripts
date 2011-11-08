backup-databases-into-s3
================================

Description
-------------------------

A script to upload compressed backups of multiple database schema to S3

Dependencies
-------------------------

  * mysqldump
  * bunzip2
  * s3cmd

Usage
-------------------------

Just customize the database connection params and schemas, and the s3 bucket, and invoke the script.
You can leave the schemas empty and pass the schemas as script params.
