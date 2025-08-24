#!/bin/bash

# Usage: ./longest_word.sh <input_file>

if [ $# -ne 1 ]; then
  echo "Usage: $0 <input_file>"
  exit 1
fi

file=$1

# Extract words, sort by length, and pick the longest
longest_word=$(tr -s '[:space:]' '\n' < "$file" | sed 's/[^a-zA-Z0-9]//g' | awk '{ if (length > max) { max=length; word=$0 } } END { print word }')

echo "The longest word in $file is: $longest_word"
