#!/bin/bash
set -x

fish_path=$(command -v fish)

if ! grep -qx "$fish_path" /etc/shells; then
  echo "$fish_path" | sudo tee -a /etc/shells
fi

if [ "$SHELL" != "$fish_path" ]; then
  chsh -s "$fish_path"
fi
