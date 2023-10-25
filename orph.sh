#!/bin/sh
[ "$(whoami)" != "root" ] && exec sudo -- "$0" "$@"
zypper packages --orphaned | awk 'NR > 4 && /^\S/ {print $5}' | xargs zypper rm -u
