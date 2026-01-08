#!/bin/bash

SOURCE="package.json"
BACKUP="package.json.bak"

if [ -f "$SOURCE" ]; then
  cp "$SOURCE" "$BACKUP"
  echo "✔ Copied $SOURCE → $BACKUP"
else
  echo "✖ $SOURCE not found, nothing to copy"
fi