#!/bin/bash

for f in $(find . -name "*.log" -mtime -1); do
	grep -E "ERROR|FATAL|CRITICAL" "$f"; grep -Ec "ERROR|FATAL|CRITICAL" "$f"
done
