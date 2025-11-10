#!/bin/bash

LOGFILE="$HOME/maintenance_suite/update_cleanup.log"
mkdir -p "$(dirname "$LOGFILE")"

echo "----------------------------------------" >> "$LOGFILE"
echo "$(date) - Starting system update..." | tee -a "$LOGFILE"

sudo apt-get update -y >>"$LOGFILE" 2>&1
sudo apt-get upgrade -y >>"$LOGFILE" 2>&1
sudo apt-get autoremove -y >>"$LOGFILE" 2>&1
sudo apt-get autoclean -y >>"$LOGFILE" 2>&1

if [ $? -eq 0 ]; then
  echo "$(date) - System updated and cleaned successfully!" | tee -a "$LOGFILE"
else
  echo "$(date) - Update or cleanup failed!" | tee -a "$LOGFILE"
fi
