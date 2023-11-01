#!/bin/sh

# Check if the script is running as root; if not, re-execute it with sudo
[ "$(whoami)" != "root" ] && exec sudo -- "$0" "$@"

# List orphaned packages and remove them
zypper packages --orphaned | awk 'NR > 4 && /^\S/ {print $5}' | xargs zypper rm -u
