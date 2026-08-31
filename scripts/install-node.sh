#!/usr/bin/env bash
set -euo pipefail

# apt's nodejs is frequently far behind; use NodeSource's LTS setup script instead.
# Needed by mason for ts_ls / pyright / jsonls / yamlls (npm-installed language servers).

NODE_MAJOR=20

if command -v node >/dev/null 2>&1; then
  current_major="$(node -v | sed -E 's/^v([0-9]+).*/\1/')"
  if [ "${current_major}" -ge "${NODE_MAJOR}" ]; then
    echo "==> node ${current_major} already installed, skipping"
    exit 0
  fi
fi

echo "==> installing Node.js ${NODE_MAJOR}.x via NodeSource"
curl -fsSL "https://deb.nodesource.com/setup_${NODE_MAJOR}.x" | sudo -E bash -
sudo apt-get install -y nodejs

echo "==> node $(node -v) / npm $(npm -v) installed"
