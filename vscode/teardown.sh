#!/bin/bash
# vscode/teardown.sh — runs during `full-stop --unlink`.
# Reverts setup.sh's macOS default. Extensions are left installed.
if [ "$(uname -s)" = "Darwin" ]; then
  defaults delete com.microsoft.VSCode ApplePressAndHoldEnabled 2>/dev/null || true
fi
