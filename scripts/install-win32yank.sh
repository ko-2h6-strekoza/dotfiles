#!/usr/bin/env bash
set -euo pipefail

# win32yank.exe is a Windows binary; WSL2's binfmt interop can execute it
# directly, so no separate Windows-side install is needed. options.lua
# already points vim.g.clipboard at it.

BIN_DIR="$HOME/.local/bin"
mkdir -p "$BIN_DIR"

if [ -x "$BIN_DIR/win32yank.exe" ]; then
  echo "==> win32yank already installed, skipping"
  exit 0
fi

TMP_ZIP="$(mktemp -t win32yank-XXXXXX.zip)"
echo "==> downloading win32yank"
curl -fL "https://github.com/equalsraf/win32yank/releases/latest/download/win32yank-x64.zip" -o "$TMP_ZIP"

unzip -o -j "$TMP_ZIP" win32yank.exe -d "$BIN_DIR"
chmod +x "$BIN_DIR/win32yank.exe"
rm -f "$TMP_ZIP"

echo "==> win32yank installed to ${BIN_DIR}/win32yank.exe"
