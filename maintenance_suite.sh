#!/bin/bash


while true; do
  clear
  echo "========================================"
  echo "     SYSTEM MAINTENANCE SUITE"
  echo "========================================"
  echo "1. Run Backup"
  echo "2. Run Update & Cleanup"
  echo "3. Monitor Logs"
  echo "4. Exit"
  echo "----------------------------------------"
  read -p "Enter your choice [1-4]: " choice

  case $choice in
    1) bash "$HOME/maintenance_suite/backup.sh"; read -p "Press Enter to continue..." ;;
    2) bash "$HOME/maintenance_suite/update_cleanup.sh"; read -p "Press Enter to continue..." ;;
    3) bash "$HOME/maintenance_suite/log_monitor.sh"; read -p "Press Enter to continue..." ;;
    4) echo "Goodbye!"; exit 0 ;;
    *) echo "Invalid option. Try again."; sleep 1 ;;
  esac
done
