#!/usr/bin/env bash
set -euo pipefail

# Official eza apt repo (https://github.com/eza-community/eza-installer),
# more reliable across Ubuntu releases than the version bundled in apt.

if command -v eza >/dev/null 2>&1; then
  echo "==> eza already installed, skipping"
  exit 0
fi

echo "==> adding eza apt repository"
sudo mkdir -p /etc/apt/keyrings
wget -qO- https://raw.githubusercontent.com/eza-community/eza/main/deb.asc \
  | sudo gpg --dearmor -o /etc/apt/keyrings/gierens.gpg
echo "deb [signed-by=/etc/apt/keyrings/gierens.gpg] http://deb.gierens.de stable main" \
  | sudo tee /etc/apt/sources.list.d/gierens.list >/dev/null
sudo chmod 644 /etc/apt/keyrings/gierens.gpg /etc/apt/sources.list.d/gierens.list

echo "==> installing eza"
sudo apt-get update
sudo apt-get install -y eza
