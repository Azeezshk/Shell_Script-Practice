#!/bin/bash
# find_palindromes.sh
# Script to find all palindrome words in a text file

FILE=$1

if [ ! -f "$FILE" ]; then
    echo "Usage: $0 <filename>"
    echo "Error: File not found!"
    exit 1
fi

echo "Palindromes in $FILE:"

# Extract words, normalize to lowercase, check palindrome
tr -cs '[:alnum:]' '\n' < "$FILE" | tr '[:upper:]' '[:lower:]' | while read word
do
    rev_word=$(echo "$word" | rev)
    if [ "$word" = "$rev_word" ] && [ ${#word} -gt 1 ]; then
        echo "$word"
    fi
done | sort | uniq
