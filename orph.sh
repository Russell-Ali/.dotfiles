#!/bin/sh

# Check if the script is running as root; if not, re-execute it with sudo
[ "$(whoami)" != "root" ] && exec sudo -- "$0" "$@"

# Check if there is any orphaned packages and remove if any.
orphaned_output=$(zypper packages --orphaned)
last_line=$(echo "$orphaned_output" | tail -n 1)

if [ "$last_line" = "No packages found." ]; then
    echo "There is no orphaned packages on system."
else
  echo "$orphaned_output" | awk 'NR > 4 && /^\S/ {print $5}' | xargs zypper rm -u
fi
