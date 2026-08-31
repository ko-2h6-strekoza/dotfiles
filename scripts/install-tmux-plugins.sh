#!/usr/bin/env bash
set -euo pipefail

# Must run after link-dotfiles.sh so ~/.config/tmux/tmux.conf is in place.

TPM_DIR="$HOME/.config/tmux/plugins/tpm"

if [ ! -d "$TPM_DIR" ]; then
  echo "==> installing tpm (tmux plugin manager)"
  git clone --depth 1 https://github.com/tmux-plugins/tpm "$TPM_DIR"
fi

echo "==> installing tmux plugins listed in tmux.conf"
"$TPM_DIR/bin/install_plugins"
