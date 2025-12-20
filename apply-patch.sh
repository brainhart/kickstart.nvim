#!/bin/bash

# Apply the init.lua patch
# Usage: ./apply-patch.sh

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PATCH_FILE="$SCRIPT_DIR/init.lua.patch"

if [[ ! -f "$PATCH_FILE" ]]; then
    echo "Error: Patch file not found: $PATCH_FILE"
    exit 1
fi

cd "$SCRIPT_DIR" || exit 1

git apply "$PATCH_FILE"

if [[ $? -eq 0 ]]; then
    echo "Patch applied successfully."
else
    echo "Failed to apply patch."
    exit 1
fi
