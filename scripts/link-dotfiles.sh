#!/usr/bin/env bash
set -euo pipefail

# Runs from anywhere; resolves the repo root relative to this script.
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_DIR="$(dirname "$SCRIPT_DIR")"
TIMESTAMP="$(date +%Y%m%d%H%M%S)"

backup_if_exists() {
  local target="$1"
  if [ -e "$target" ] && [ ! -L "$target" ]; then
    echo "==> backing up existing $target -> ${target}.bak.${TIMESTAMP}"
    mv "$target" "${target}.bak.${TIMESTAMP}"
  fi
}

backup_if_exists "$HOME/.config/fish"
backup_if_exists "$HOME/.config/nvim"
backup_if_exists "$HOME/.config/tmux"

mkdir -p "$HOME/.config"

echo "==> stowing fish + nvim + tmux into $HOME"
cd "$REPO_DIR"
stow -t "$HOME" fish nvim tmux

echo "==> linked. ~/.config/fish, ~/.config/nvim and ~/.config/tmux now point into $REPO_DIR"
