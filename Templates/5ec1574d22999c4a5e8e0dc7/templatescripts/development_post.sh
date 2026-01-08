#!/bin/bash

export NODE_ENV=development

PKG="package.json"
BACK="package.json.bak"

# Check npm existence
if ! which npm >/dev/null 2>&1; then
  echo 'NPM not found'
  exit 1
fi

# Ensure both files exist
if [ ! -f "$PKG" ] || [ ! -f "$BACK" ]; then
  echo "package.json or package.json.bak missing, running npm install"
  npm install --loglevel notice 2>&1
  cp "$PKG" "$BACK"
  exit 0
fi

# Compare files
if diff -q "$PKG" "$BACK" >/dev/null; then
  echo "No dependency changes detected, skipping npm install"
else
  echo "package.json changed, running npm install"
  npm install --loglevel notice 2>&1
  cp "$PKG" "$BACK"
  echo "package.json.bak updated"
fi

# Cleanup
rm "$BACK"