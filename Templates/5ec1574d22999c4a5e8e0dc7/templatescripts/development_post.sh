#!/bin/bash

export NODE_ENV=development

PKG="package.json"
BACK="package.json.bak"

# Detect package manager
if command -v pnpm >/dev/null 2>&1; then
  PM="pnpm"
  INSTALL_CMD="pnpm install --force --yes"
elif command -v npm >/dev/null 2>&1; then
  PM="npm"
  INSTALL_CMD="npm install --yes --loglevel notice"
else
  echo "No package manager found (pnpm or npm)"
  exit 1
fi

echo "Using package manager: $PM"

# If files are missing, force install
if [ ! -f "$PKG" ] || [ ! -f "$BACK" ]; then
  echo "package.json or package.json.bak missing, running install"
  $INSTALL_CMD 2>&1
  cp "$PKG" "$BACK"
  exit 0
fi

# Compare files
if diff -q "$PKG" "$BACK" >/dev/null; then
  echo "No dependency changes detected, skipping install"
else
  echo "package.json changed, running install"
  $INSTALL_CMD 2>&1
  cp "$PKG" "$BACK"
  echo "package.json.bak updated"
fi

# Cleanup
rm -f "$BACK"
