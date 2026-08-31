#!/usr/bin/env bash
set -euo pipefail

echo "==> apt update/upgrade"
sudo apt-get update
sudo apt-get upgrade -y

echo "==> installing base packages"
sudo apt-get install -y \
  build-essential \
  curl \
  ca-certificates \
  gnupg \
  unzip \
  fish \
  stow \
  ripgrep \
  fd-find \
  fzf \
  python3 \
  python3-pip \
  git

# Debian/Ubuntu installs fd as `fdfind`; expose it as `fd` for tools that expect that name.
mkdir -p "$HOME/.local/bin"
if command -v fdfind >/dev/null 2>&1 && ! command -v fd >/dev/null 2>&1; then
  ln -sf "$(command -v fdfind)" "$HOME/.local/bin/fd"
fi

echo "==> base packages installed"
