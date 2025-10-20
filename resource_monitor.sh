#!/bin/bash

# Thresholds
CPU_THRESHOLD=80
RAM_THRESHOLD=80
DISK_THRESHOLD=90

# Get current usage
CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print 100 - $8}')
RAM_USAGE=$(free | awk '/Mem/ {printf("%.0f"), $3/$2 * 100}')
DISK_USAGE=$(df / | awk 'END {print $5}' | sed 's/%//')

# Check CPU
if (( $(echo "$CPU_USAGE > $CPU_THRESHOLD" | bc -l) )); then
    echo "⚠️ CPU usage is high: ${CPU_USAGE}%"
fi

# Check RAM
if (( RAM_USAGE > RAM_THRESHOLD )); then
    echo "⚠️ RAM usage is high: ${RAM_USAGE}%"
fi
# Check Disk
if (( DISK_USAGE > DISK_THRESHOLD )); then
    echo "⚠️ Disk usage is high: ${DISK_USAGE}%"
fi
