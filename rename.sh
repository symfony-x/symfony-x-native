#!/bin/bash

# Define the target directory
TARGET_DIR="dev/bootstrap-examples/"

# Find all .html files and rename them to .phtml
find "$TARGET_DIR" -type f -name "*.html" | while read -r file; do
    mv -- "$file" "${file%.html}.phtml"
done
