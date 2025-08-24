#!/bin/bash

# Usage: ./duplicate_lines.sh <input_file>

if [ $# -ne 1 ]; then
  echo "Usage: $0 <input_file>"
  exit 1
fi

file=$1

echo "Duplicate lines in $file:"

# Sort → uniq with count → filter where count > 1
sort "$file" | uniq -c | awk '$1 > 1 {print $1, $2}'
