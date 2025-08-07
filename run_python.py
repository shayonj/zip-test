#!/usr/bin/env python3

import json
import os
import sys
import platform
import datetime
from pathlib import Path

def main():
    print("=== test Zip Package Python Execution Started ===")
    print(f"Working directory: {os.getcwd()}")
    print("Available files:")
    for item in os.listdir('.'):
        print(f"  {item}")

    # Read input from test
    input_file = "/tmp/test_input.json"
    if os.path.exists(input_file):
        print("=== Input from test ===")
        with open(input_file, 'r') as f:
            input_data = json.load(f)
            print(json.dumps(input_data, indent=2))

        name = input_data.get('name', 'World')
        message = input_data.get('message', 'Hello from test Zip Package Python!')
    else:
        print(f"No input file found at {input_file}")
        name = "World"
        message = "Hello from test Zip Package Python!"

    print("=== Processing ===")
    print(f"Processing input for: {name}")

    # Show Python capabilities
    print(f"Python version: {sys.version}")
    print(f"Platform: {platform.platform()}")
    print(f"Current time: {datetime.datetime.now().isoformat()}")

    # Create output for test
    output_data = {
        "success": True,
        "message": message,
        "processed_for": name,
        "timestamp": datetime.datetime.utcnow().isoformat(),
        "python_info": {
            "version": sys.version,
            "platform": platform.platform(),
            "executable": sys.executable
        },
        "system_info": {
            "os": platform.system(),
            "architecture": platform.machine(),
            "hostname": platform.node()
        },
        "execution_details": {
            "working_directory": os.getcwd(),
            "available_files": os.listdir('.'),
            "python_path": sys.path,
            "environment_vars": {
                "PATH": os.environ.get("PATH", ""),
                "HOME": os.environ.get("HOME", ""),
                "USER": os.environ.get("USER", "")
            }
        }
    }

    output_file = "/tmp/test_output.json"
    with open(output_file, 'w') as f:
        json.dump(output_data, f, indent=2)

    print("=== Output created ===")
    print("Contents of output file:")
    with open(output_file, 'r') as f:
        print(f.read())

    print("=== test Zip Package Python Execution Completed ===")

if __name__ == "__main__":
    main()
