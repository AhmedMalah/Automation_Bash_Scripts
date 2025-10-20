#!/bin/bash

# List of services to check
SERVICES=("nginx" "apache2" "mysql" "ssh")

# Timestamp for logging
TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")

echo "[$TIMESTAMP] Checking services..."

for service in "${SERVICES[@]}"; do
    if systemctl is-active --quiet "$service"; then
        echo "✅ $service is running."
    else
        echo "❌ $service is NOT running!"
    fi
done
