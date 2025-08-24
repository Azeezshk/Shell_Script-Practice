#!/bin/bash

file="file.txt"

awk '{
  for (i=1; i<=NF; i++) {
    # Save each field into an array by column index
    a[i] = (i in a ? a[i] FS $i : $i)
  }
}
END {
  # Print row by row from collected columns
  for (i=1; i<=NF; i++) {
    print a[i]
  }
}' "$file"
