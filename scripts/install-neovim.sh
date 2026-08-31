#!/usr/bin/env bash
set -euo pipefail

# Always install the latest stable Neovim release straight from GitHub into
# /opt/nvim, since apt's version lags behind (and config.fish already puts
# /opt/nvim on PATH).

INSTALL_DIR="/opt/nvim"
TARBALL_URL="https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz"
TMP_TAR="$(mktemp -t nvim-XXXXXX.tar.gz)"

echo "==> downloading latest stable Neovim"
curl -fL "$TARBALL_URL" -o "$TMP_TAR"

echo "==> installing to ${INSTALL_DIR}"
sudo rm -rf "$INSTALL_DIR"
sudo mkdir -p "$INSTALL_DIR"
sudo tar -xzf "$TMP_TAR" -C "$INSTALL_DIR" --strip-components=1
rm -f "$TMP_TAR"

echo "==> $("$INSTALL_DIR"/bin/nvim --version | head -n1) installed"
