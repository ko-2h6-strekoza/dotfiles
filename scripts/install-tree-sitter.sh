#!/usr/bin/env bash
set -euo pipefail

# tree-sitter CLI builds parsers for nvim-treesitter (main branch).
# It needs 0.26.1+, and its README says not to use the npm package. apt's
# version is too old, so install the official release binary instead.

TS_VERSION="0.27.0"
MIN_VERSION="0.26.1"
BIN_DIR="$HOME/.local/bin"

if command -v tree-sitter >/dev/null 2>&1; then
  current="$(tree-sitter --version | awk '{print $2}')"
  if [ "$(printf '%s\n%s\n' "$MIN_VERSION" "$current" | sort -V | head -1)" = "$MIN_VERSION" ]; then
    echo "==> tree-sitter ${current} already installed, skipping"
    exit 0
  fi
fi

case "$(uname -m)" in
  x86_64) arch="x64" ;;
  aarch64) arch="arm64" ;;
  *) echo "!! unsupported architecture: $(uname -m)" >&2; exit 1 ;;
esac

mkdir -p "$BIN_DIR"
echo "==> installing tree-sitter ${TS_VERSION}"
curl -fL "https://github.com/tree-sitter/tree-sitter/releases/download/v${TS_VERSION}/tree-sitter-linux-${arch}.gz" \
  | gunzip > "$BIN_DIR/tree-sitter"
chmod +x "$BIN_DIR/tree-sitter"

echo "==> tree-sitter $("$BIN_DIR/tree-sitter" --version | awk '{print $2}') installed to ${BIN_DIR}/tree-sitter"
