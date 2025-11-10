#!/bin/bash


SOURCE="$HOME/Documents"
DESTINATION="$HOME/system_backups"
LOGFILE="$HOME/maintenance_suite/backup.log"

mkdir -p "$DESTINATION"
mkdir -p "$(dirname "$LOGFILE")"

echo "----------------------------------------" >> "$LOGFILE"
echo "$(date) - Starting Backup..." | tee -a "$LOGFILE"

if [ ! -d "$SOURCE" ]; then
  echo "Source folder not found: $SOURCE" | tee -a "$LOGFILE"
  exit 1
fi

FILENAME="backup_$(date +%Y%m%d_%H%M%S).tar.gz"
tar -czf "$DESTINATION/$FILENAME" "$SOURCE" 2>>"$LOGFILE"

if [ $? -eq 0 ]; then
  echo "$(date) - Backup completed successfully!" | tee -a "$LOGFILE"
  echo "File saved at: $DESTINATION/$FILENAME" | tee -a "$LOGFILE"
else
  echo "$(date) - Backup failed!" | tee -a "$LOGFILE"
fi
