#!/bin/bash

# Load environment variables
source ./backup/.env

# Timestamp for the backup file
TIMESTAMP=$(date "+%Y%m%d%H%M%S")

# Backup file name
BACKUP_FILE="backup_${TIMESTAMP}.sql.gz"

# Set the PGPASSWORD environment variable
export PGPASSWORD="$PGPASSWORD"

# Perform the database backup
mkdir -p ./backup/temp
pg_dump -h "$PGHOST" -p "$PGPORT" -U "$PGUSER" "$PGDATABASE" | gzip > ./backup/temp/"$BACKUP_FILE"

# Back up processing
if gsutil --impersonate-service-account="$IMPERSONATE_SERVICE_ACCOUNT"\
  cp ./backup/temp/"$BACKUP_FILE" gs://"$GCS_BUCKET"/"$GCS_BACKUP_PATH"/; then
    echo "Successfully back up to Google Cloud Storage"
    echo "gs://advesa_data_psql_backup/backup/$BACKUP_FILE" >> ./log.txt
else
    echo "Backup failed."
fi

# Delete old backup files
rm ./backup/temp/*