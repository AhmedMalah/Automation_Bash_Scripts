#!/bin/bash

# Settings
LOG_DIR="/var/log/myapp"
ARCHIVE_DIR="/var/log/myapp/archive"
MAX_SIZE_MB=50

# Create archive directory if it doesn't exist
mkdir -p "$ARCHIVE_DIR"

# Archive log files larger than 50MB
find "$LOG_DIR" -type f -name "*.log" -size +"${MAX_SIZE_MB}"M | while read logfile; do
    filename=$(basename "$logfile")
    timestamp=$(date +"%Y%m%d_%H%M%S")
    gzip -c "$logfile" > "$ARCHIVE_DIR/${filename}_${timestamp}.gz"
    echo "Archived: $logfile"
done

# Delete archived logs older than 30 days
find "$ARCHIVE_DIR" -type f -name "*.gz" -mtime +30 -exec rm -f {} \;
