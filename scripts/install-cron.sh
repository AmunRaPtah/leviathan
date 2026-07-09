#!/usr/bin/env bash
# Install (or refresh) the daily Aqueduct harvest cron job.
# Usage: scripts/install-cron.sh ["MIN HOUR"]   e.g. "17 3" = 03:17 daily (default).

set -eu
PROJECT="/root/projects/leviathan"
SCRIPT="$PROJECT/scripts/harvest.sh"
WHEN="${1:-17 3}"   # "MIN HOUR"
LINE="$WHEN * * * $SCRIPT   # leviathan-harvest"

chmod +x "$SCRIPT"

# Keep every existing line except a prior leviathan-harvest entry, then append ours.
existing="$(crontab -l 2>/dev/null | grep -v 'leviathan-harvest' || true)"
{ [ -n "$existing" ] && printf '%s\n' "$existing"; printf '%s\n' "$LINE"; } | crontab -

echo "Installed cron job:"
crontab -l | grep 'leviathan-harvest' || echo "(failed to install)"
