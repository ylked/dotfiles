#!/usr/bin/env bash

set -euo pipefail

SOURCE="$(pwd)/.zshrc"
TARGET="$HOME/.zshrc"

# Check if the source file exists
if [ ! -f "$SOURCE" ]; then
    echo "Error: Source file '$SOURCE' does not exist." >&2
    exit 1
fi

# Check if the target already points to the source
if [ -L "$TARGET" ] && [ "$(readlink -f "$TARGET")" = "$SOURCE" ]; then
    echo "Symlink already correctly set: $TARGET -> $SOURCE"
    exit 0
fi

# Handle overwrite confirmation if target exists
if [ -e "$TARGET" ] || [ -L "$TARGET" ]; then
    read -r -p "File '$TARGET' already exists. Overwrite? [y/N] " response
    case "$response" in
        [yY][eE][sS]|[yY])
            rm -rf "$TARGET"
            ;;
        *)
            echo "Operation cancelled."
            exit 0
            ;;
    esac
fi

# Create symlink
ln -s "$SOURCE" "$TARGET"
echo "Linked: $TARGET -> $SOURCE"
