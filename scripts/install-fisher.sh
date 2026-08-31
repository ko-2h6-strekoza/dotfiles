#!/usr/bin/env bash
set -euo pipefail

# Must run after link-dotfiles.sh so ~/.config/fish/fish_plugins is in place.

if [ ! -f "$HOME/.config/fish/fish_plugins" ]; then
  echo "!! ~/.config/fish/fish_plugins not found; run scripts/link-dotfiles.sh first" >&2
  exit 1
fi

echo "==> installing fisher + fish plugins"
fish -c '
  if not functions -q fisher
    curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source
    fisher install jorgebucaran/fisher
  end
  fisher update
'
