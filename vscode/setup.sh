#!/bin/bash
# vscode/setup.sh — runs during `full-stop` (and `full-stop vscode`).
# Installs the extensions listed in extensions.txt and applies macOS tweaks.
set -euo pipefail

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if ! command -v code >/dev/null 2>&1; then
  echo "vscode: 'code' CLI not found; install VS Code (Brewfile: cask 'visual-studio-code') and re-run" >&2
  exit 0
fi

installed="$(code --list-extensions | tr '[:upper:]' '[:lower:]')"

while IFS= read -r line || [ -n "$line" ]; do
  ext="${line%%#*}"
  ext="${ext//[[:space:]]/}"
  [ -z "$ext" ] && continue

  if grep -qx "$(printf '%s' "$ext" | tr '[:upper:]' '[:lower:]')" <<<"$installed"; then
    echo "vscode: $ext (already installed)"
  else
    echo "vscode: installing $ext"
    code --install-extension "$ext" --force >/dev/null \
      || echo "vscode: FAILED to install $ext" >&2
  fi
done < "$script_dir/extensions.txt"

if [ "$(uname -s)" = "Darwin" ]; then
  # Let held h/j/k/l repeat instead of opening the accent picker
  # (recommended by VSCodeVim). Reversed by teardown.sh.
  defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false
  echo "vscode: disabled macOS press-and-hold for VS Code (key repeat for vim motions)"
fi
