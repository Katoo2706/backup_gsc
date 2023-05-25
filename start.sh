#!/bin/bash

# Perform the login to Google Cloud Storage
gcloud auth login --no-launch-browser

# Check if the login was successful
if [ $? -eq 0 ]; then
    echo "======================================"
    echo "Google Cloud Storage login successful."

    # Run the backup script
    ./backup/backup.sh
else
    echo "============================================================="
    echo "Google Cloud Storage login failed. Backup script not executed."
fi