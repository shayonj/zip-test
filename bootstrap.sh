#!/bin/bash

echo "Hello from Tines Zip Package!"
echo "Working directory: $(pwd)"
echo "Files in directory:"
ls -la

# Read input if it exists
if [ -f "/tmp/tines_input.json" ]; then
    echo "Input received:"
    cat /tmp/tines_input.json
fi

# Create simple output
cat > /tmp/tines_output.json << 'EOL'
{
  "success": true,
  "message": "Zip package executed successfully!",
  "timestamp": "2025-01-07T23:45:00Z"
}
EOL

echo "Output created:"
cat /tmp/tines_output.json

echo "Done!"
