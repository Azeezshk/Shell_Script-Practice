#!/bin/bash

if [ $# -lt 1 ]; then
    echo "Usage: $0 filename"
    exit 1
fi

FILE=$1

if [ ! -f "$FILE" ]; then
    echo "Error: File '$FILE' not found!"
    exit 1
fi

echo "Top 5 most frequent words in $FILE:"
cat "$FILE" \
  | tr '[:upper:]' '[:lower:]' \
  | tr -s '[:space:]' '\n' \
  | tr -d '[:punct:]' \
  | sort \
  | uniq -c \
  | sort -nr \
  | head -5
