#!/bin/bash

# Check if file is given
if [ -z "$1" ]; then
    echo "Usage: $0 filename"
    exit 1
fi

file="$1"

# Count words (case-insensitive, remove punctuation)
echo "Top 5 most frequent words in $file (with ties):"
tr '[:upper:]' '[:lower:]' < "$file" | \
tr -d '[:punct:]' | \
tr '[:space:]' '\n' | \
grep -v '^$' | \
sort | uniq -c | sort -nr | \
awk 'NR<=5 {print; prev=$1; next} $1==prev {print}'