#!/bin/bash

# Check if the output file parameter is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <output_file>"
  exit 1
fi

OUTPUT_FILE="$1"

# Make the HTTP request with a custom header
RESPONSE=$(curl -s -H "Content-Type: application/json" -H "Your-Header-Name: Your-Header-Value" "https://jsonplaceholder.typicode.com/todos/1")

# Format JSON manually (indentation and new lines)
FORMATTED_JSON=$(echo "$RESPONSE" | sed 's/{/{\n  /g' | sed 's/,/,\n  /g' | sed 's/}/\n}/g')

# Save to file
echo "$FORMATTED_JSON" > "$OUTPUT_FILE"

echo "Response saved to $OUTPUT_FILE"
