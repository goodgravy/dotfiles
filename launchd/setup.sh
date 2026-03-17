#!/bin/sh
#
# launchd/setup.sh — install and load the full-stop launch agent.

PLIST_NAME="com.jmsbrdy.full-stop.plist"
SRC="${DOTFILES:-${HOME}/.dotfiles}/launchd/${PLIST_NAME}"
DEST="${HOME}/Library/LaunchAgents/${PLIST_NAME}"

mkdir -p "${HOME}/Library/LaunchAgents"

# Unload first if already loaded (ignore errors if not loaded)
launchctl unload "${DEST}" 2>/dev/null || true

# Symlink the plist
if [ -L "${DEST}" ]; then
  rm "${DEST}"
fi

if [ -e "${DEST}" ]; then
  echo "  [ SKIP ] ${DEST} exists and is not a symlink — back it up first"
  exit 0
fi

ln -s "${SRC}" "${DEST}"
echo "  [ OK ] Linked ${PLIST_NAME} → ~/Library/LaunchAgents/"

# Load the agent
launchctl load "${DEST}"
echo "  [ OK ] Loaded ${PLIST_NAME}"
