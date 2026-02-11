#!/usr/bin/env bash
#!/bin/bash

# Script to navigate to the site-packages directory of the current virtual environment
# Check if we're in a virtual environment
if [ -z "$VIRTUAL_ENV" ]; then
    echo "Error: No virtual environment is currently active." >&2
    echo "."
    exit 1
fi

# Get the Python version from the lib directory (e.g., python3.10)
# Use a glob pattern to find python version directories
for dir in "$VIRTUAL_ENV/lib"/python[0-9]*.[0-9]*; do
    if [ -d "$dir" ]; then
        PYTHON_VERSION=$(basename "$dir")
        break
    fi
done

# Check if we found a Python version directory
if [ -z "$PYTHON_VERSION" ]; then
    echo "Error: Could not find Python version directory in $VIRTUAL_ENV/lib" >&2
    echo "."
    exit 1
fi

# Construct the site-packages path
SITE_PACKAGES="$VIRTUAL_ENV/lib/$PYTHON_VERSION/site-packages"

# Check if the directory exists
if [ ! -d "$SITE_PACKAGES" ]; then
    echo "Error: Site-packages directory not found at: $SITE_PACKAGES" >&2
    echo "."
    exit 1
fi

# Output the site-packages path to stdout
echo "$SITE_PACKAGES"
