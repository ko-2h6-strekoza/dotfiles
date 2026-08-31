#!/usr/bin/env bash
set -euo pipefail

if command -v zoxide >/dev/null 2>&1; then
  echo "==> zoxide already installed, skipping"
  exit 0
fi

echo "==> installing zoxide"
curl -sS https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | bash
