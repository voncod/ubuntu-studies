#!/bin/bash

ERROR_PATTERNS=("ERROR" "FATAL" "CRITICAL")
LOG_DIR="/mnt/c/Users/dk-lu/Documents/Ubuntu-estudos/logs"

echo "Analysing log files"
echo "==================="

echo -e "\nList of log files updated in last 24 hours"
LOG_FILES=$(find "$LOG_DIR" -type f -name "*.log" -mmin -1440)
echo "$LOG_FILES"

[ -z "$LOG_FILES" ] && { echo "Nenhum .log recente encontrado."; exit 0; }

for LOG_FILE in $LOG_FILES; do
    echo -e "\nSearching ${ERROR_PATTERNS[0]} logs in $LOG_FILE"
    grep "${ERROR_PATTERNS[0]}" "$LOG_FILE" || true

    echo -e "\nNumber of ${ERROR_PATTERNS[0]} logs found in $LOG_FILE"
    grep -c "${ERROR_PATTERNS[0]}" "$LOG_FILE"

    echo -e "\nSearching ${ERROR_PATTERNS[1]} logs in $LOG_FILE"
    grep "${ERROR_PATTERNS[1]}" "$LOG_FILE" || true

    echo -e "\nNumber of ${ERROR_PATTERNS[1]} logs found in $LOG_FILE"
    grep -c "${ERROR_PATTERNS[1]}" "$LOG_FILE"

    echo -e "\nSearching ${ERROR_PATTERNS[2]} logs in $LOG_FILE"
    grep "${ERROR_PATTERNS[2]}" "$LOG_FILE" || true

    echo -e "\nNumber of ${ERROR_PATTERNS[2]} logs found in $LOG_FILE"
    grep -c "${ERROR_PATTERNS[2]}" "$LOG_FILE"
done
