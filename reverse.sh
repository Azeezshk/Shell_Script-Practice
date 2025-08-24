#!/bin/bash

input="input.txt"
output="reversed.txt"

# Reverse each line using rev and save to output
while IFS= read -r line; do
  echo "$line" | rev
done < "$input" > "$output"

echo "Reversed content saved to $output"
