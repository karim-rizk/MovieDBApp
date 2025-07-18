#!/bin/bash
set -euo pipefail

# Path to Mint binary (adjust if needed)
MINT_BIN="/opt/homebrew/bin/mint"

# Validate Mint installation
if [ ! -x "$MINT_BIN" ]; then
  echo "🚨 Mint not found at $MINT_BIN. Please install Mint."
  exit 1
fi

echo "🧼 Running SwiftFormat with project configuration..."

# Run SwiftFormat on all files using .swiftformat config in repo root
$MINT_BIN run swiftformat . --config .swiftformat

echo "✅ SwiftFormat completed successfully."
