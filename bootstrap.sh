#!/usr/bin/env bash
set -euo pipefail

# One-shot environment setup for a fresh WSL2 Ubuntu install.
# Run from anywhere inside the repo, e.g.:
#   cd /mnt/c/Users/strekoza/dev/dotfiles && ./bootstrap.sh

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if ! grep -qi microsoft /proc/version 2>/dev/null; then
  echo "!! this doesn't look like WSL - continuing anyway" >&2
fi

steps=(
  "install-packages.sh"
  "install-node.sh"
  "install-neovim.sh"
  "install-eza.sh"
  "install-zoxide.sh"
  "install-win32yank.sh"
  "link-dotfiles.sh"
  "install-fisher.sh"
)

for step in "${steps[@]}"; do
  echo
  echo "########## ${step} ##########"
  bash "${SCRIPT_DIR}/scripts/${step}"
done

echo
echo "########## pre-fetching neovim plugins ##########"
PATH="/opt/nvim/bin:$PATH" nvim --headless "+Lazy! sync" +qa || true

cat <<'EOF'

==================== bootstrap complete ====================

Remaining manual steps:
  1. Make fish your login shell:
       chsh -s "$(which fish)"
     (log out/reopen the terminal afterwards)
  2. Open `nvim` once and wait for Mason to finish installing the
     LSP servers (lua_ls, ts_ls, pyright, jsonls, yamlls) - this
     happens automatically but takes a minute on first launch.
  3. Verify clipboard interop: yank a line in nvim, paste in Windows.

===============================================================
EOF
