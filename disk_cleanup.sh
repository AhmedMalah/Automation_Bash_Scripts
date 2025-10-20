#!/bin/bash

# Directories to clean
TEMP_DIRS=("/tmp" "/var/tmp")
CACHE_DIRS=("$HOME/.cache")

# Log file for cleanup actions
LOG_FILE="/var/log/disk_cleanup.log"
TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")

echo "[$TIMESTAMP] Starting disk cleanup..." >> "$LOG_FILE"

# Clean temp directories
for dir in "${TEMP_DIRS[@]}"; do
    if [ -d "$dir" ]; then
        find "$dir" -type f -atime +7 -exec rm -f {} \;
        echo "[$TIMESTAMP] Cleaned old files from $dir" >> "$LOG_FILE"
    fi
done

# Clean user cache
for dir in "${CACHE_DIRS[@]}"; do
    if [ -d "$dir" ]; then
        rm -rf "$dir"/*
        echo "[$TIMESTAMP] Cleared cache in $dir" >> "$LOG_FILE"
    fi
done

echo "[$TIMESTAMP] Disk cleanup completed." >> "$LOG_FILE"
