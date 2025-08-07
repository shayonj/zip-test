#!/bin/bash

# test Zip Package with Custom Paths Test
echo "=== Custom Paths Test Started ==="

# Check for custom input/output paths from environment or use defaults
INPUT_FILE="${test_INPUT_FILE:-/custom/input.json}"
OUTPUT_FILE="${test_OUTPUT_FILE:-/custom/output.json}"

echo "Input file: $INPUT_FILE"
echo "Output file: $OUTPUT_FILE"

# Create directories if they don't exist
mkdir -p "$(dirname "$INPUT_FILE")"
mkdir -p "$(dirname "$OUTPUT_FILE")"

# Read input
if [ -f "$INPUT_FILE" ]; then
    echo "=== Custom Input Found ==="
    cat "$INPUT_FILE"

    if command -v jq &> /dev/null; then
        NAME=$(jq -r '.name // "CustomUser"' "$INPUT_FILE")
        MESSAGE=$(jq -r '.message // "Hello from custom paths!"' "$INPUT_FILE")
    else
        NAME="CustomUser"
        MESSAGE="Hello from custom paths!"
    fi
else
    echo "No input file found at $INPUT_FILE"
    NAME="CustomUser"
    MESSAGE="Hello from custom paths!"
fi

# Create custom output
cat > "$OUTPUT_FILE" << EOL
{
  "success": true,
  "message": "$MESSAGE",
  "processed_for": "$NAME",
  "custom_paths": {
    "input_file": "$INPUT_FILE",
    "output_file": "$OUTPUT_FILE"
  },
  "timestamp": "$(date -u -Iseconds)",
  "test_type": "custom_paths"
}
EOL

echo "=== Custom Output Created ==="
echo "Output written to: $OUTPUT_FILE"
cat "$OUTPUT_FILE"

echo "=== Custom Paths Test Completed ==="
exit 0
