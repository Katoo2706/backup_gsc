#!/bin/bash

# Load environment variables
source ./backup/.env

# Get backup file name
BACKUPFILE=$(tail -n 1 log.txt)

# Create fol to store backup file
mkdir -p ./backup/temp_restore

# Download backup file
if gsutil --impersonate-service-account="$IMPERSONATE_SERVICE_ACCOUNT"\
  cp "$BACKUPFILE" backup/temp_restore; then
    echo "================="
    echo "Download restore file ${BACKUPFILE}"
else
    echo "Restore failed"
fi