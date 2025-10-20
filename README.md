# Bash Scripts Automation

A collection of practical Bash scripts for automating system tasks like log archiving, resource monitoring, and routine maintenance. Ideal for sysadmins, DevOps learners, and anyone looking to simplify Linux server management.

---

## 📁 Scripts Included

### 1. `log_archiver.sh`
Archives log files larger than 50MB and deletes archived logs older than 30 days.

- **Log Directory:** `/var/log/myapp`
- **Archive Directory:** `/var/log/myapp/archive`
- **Cron Job:**
  ```cron
  0 2 * * 6 /path/to/scripts/log_archiver.sh >> /var/log/log_archiver.log 2>&1
  ```

---

### 2. `resource_monitor.sh`
Monitors CPU, RAM, and Disk usage. Prints alerts if usage exceeds defined thresholds.

- **Thresholds:**
  - CPU > 80%
  - RAM > 80%
  - Disk > 90%
- **Cron Job:**
  ```cron
  */10 * * * * /path/to/scripts/resource_monitor.sh >> /var/log/resource_monitor.log 2>&1
  ```

---

### 3. `disk_cleanup.sh`
Cleans temporary files and user cache to free up disk space.

- **Targets:**
  - `/tmp`, `/var/tmp`
  - `$HOME/.cache`
- **Cron Job:**
  ```cron
  0 3 * * 0 /path/to/scripts/disk_cleanup.sh >> /var/log/disk_cleanup.log 2>&1
  ```

---

### 4. `service_checker.sh`
Checks if essential services (e.g., nginx, apache2, mysql, ssh) are running and prints their status.

- **Cron Job:**
  ```cron
  0 * * * * /path/to/scripts/service_checker.sh >> /var/log/service_checker.log 2>&1
  ```

---

### 5. `uptime_report.sh`
Displays system uptime, load average, and currently logged-in users.

- **Note:** This script is intended for manual use, but can be scheduled if needed.

---

## 📂 Cron Jobs Summary

You can find all cron jobs in a separate file: `cron_jobs.txt`

---

## ✅ Usage

1. Make scripts executable:
   ```bash
   chmod +x scripts/*.sh
   ```

2. Run any script manually:
   ```bash
   ./scripts/script_name.sh
   ```

3. To schedule scripts, use `crontab -e` and add the relevant cron job.

---

