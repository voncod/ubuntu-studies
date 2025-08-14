#!/bin/bash

find . -name "*.log" -mtime -1 -exec sh -c '
  for f; do
	  echo "Analisando $f:"
	  grep -E "ERROR|FATAL|CRITICAL" "$f"
	  grep -c "ERROR" "$f"
	  grep -c "FATAL" "$f"
	  grep -c "CRITICAL" "$f"
  done
' sh {} +
