#!/bin/bash

ERROR_PATTERNS=("ERROR" "FATAL" "CRITICAL")

LOG_DIR="/home/dk-lu/Ubuntu-estudos"

echo "analysing log files"
echo "==================="

echo -e "\nList of log files updated in last 24 hours"
LOG_FILES=$(find "$LOG_DIR" -name "*.log")
echo "$LOG_FILES"

for LOG_FILE in $LOG_FILES; do
    echo -e "\nsearching ${ERROR_PATTERNS[0]} logs in $LOG_FILE file"
    grep "${ERROR_PATTERNS[0]}" "$LOG_FILE"

    echo -e "\nNumber of ${ERROR_PATTERNS[0]} logs found in $LOG_FILE"
    grep -c "${ERROR_PATTERNS[0]}" "$LOG_FILE"

    echo -e "\nsearching ${ERROR_PATTERNS[1]} logs in $LOG_FILE file"
    grep "${ERROR_PATTERNS[1]}" "$LOG_FILE"

    echo -e "\nNumber of ${ERROR_PATTERNS[1]} logs found in $LOG_FILE"
    grep -c "${ERROR_PATTERNS[1]}" "$LOG_FILE"

    echo -e "\nNumber of ${ERROR_PATTERNS[2]} logs found in $LOG_FILE"
    grep "${ERROR_PATTERNS[2]}" "$LOG_FILE"

    echo -e "\nNumber of ${ERROR_PATTERNS[2]} logs found in $LOG_FILE"
    grep -c "${ERROR_PATTERNS[2]}" "$LOG_FILE"
done
