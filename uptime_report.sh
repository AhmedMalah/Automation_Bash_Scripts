#!/bin/bash

# Timestamp
TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")

echo "===== Uptime Report ====="
echo "Generated at: $TIMESTAMP"
echo

# Uptime
echo "🕒 System Uptime:"
uptime -p
echo

# Load average
echo "📈 Load Average:"
uptime | awk -F'load average:' '{ print $2 }'
echo

# Logged-in users
echo "👥 Currently Logged-in Users:"
who
