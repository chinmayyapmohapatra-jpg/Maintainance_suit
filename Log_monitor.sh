#!/bin/bash


LOG_DIR="$HOME/maintenance_suite"
MONITOR_LOG="$LOG_DIR/log_monitor.log"

mkdir -p "$LOG_DIR"
echo "----------------------------------------" >> "$MONITOR_LOG"
echo "$(date) - Starting log monitoring..." | tee -a "$MONITOR_LOG"

for file in "$LOG_DIR"/*.log; do
  if [ -f "$file" ]; then
    grep -Ei "error|fail|warn" "$file" >> "$MONITOR_LOG"
  fi
done

echo "$(date) - Log monitoring finished!" | tee -a "$MONITOR_LOG"
