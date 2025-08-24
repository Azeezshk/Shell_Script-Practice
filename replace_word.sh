#!/bin/bash

# Usage: ./replace_word.sh input_file old_word new_word

if [ $# -ne 3 ]; then
  echo "Usage: $0 <input_file> <old_word> <new_word>"
  exit 1
fi

input_file=$1
old_word=$2
new_word=$3

# Replace word using sed
sed "s/\b$old_word\b/$new_word/g" "$input_file" > temp.txt && mv temp.txt "$input_file"

echo "Replaced '$old_word' with '$new_word' in $input_file"
