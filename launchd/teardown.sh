#!/bin/sh
#
# launchd/teardown.sh — unload and remove the full-stop launch agent.

PLIST_NAME="com.jmsbrdy.full-stop.plist"
DEST="${HOME}/Library/LaunchAgents/${PLIST_NAME}"

if [ -e "${DEST}" ]; then
  launchctl unload "${DEST}" 2>/dev/null || true
  rm "${DEST}"
  echo "  [ OK ] Unloaded and removed ${PLIST_NAME}"
else
  echo "  [ SKIP ] ${PLIST_NAME} not installed"
fi
