#!/bin/bash

# Usage: ./bulk_rename.sh <directory_path>

if [ $# -ne 1 ]; then
  echo "Usage: $0 <directory_path>"
  exit 1
fi

dir=$1
timestamp=$(date +%Y%m%d)

# Check if directory exists
if [ ! -d "$dir" ]; then
  echo "Error: $dir is not a valid directory"
  exit 1
fi

# Rename all .txt files
for file in "$dir"/*.txt; do
  if [ -f "$file" ]; then
    base=$(basename "$file")
    newname="${timestamp}_${base}"
    mv "$file" "$dir/$newname"
    echo "Renamed: $file -> $newname"
  fi
done

echo "✅ All .txt files renamed successfully!"
