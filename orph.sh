#!/bin/sh

# ANSI color codes
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'  # No Color

# Check if the script is running as root; if not, re-execute it with sudo
[ "$(whoami)" != "root" ] && exec sudo -- "$0" "$@"

# Check for orphaned packages and remove them if any
orphaned_output=$(zypper packages --orphaned 2>/dev/null)
last_line=$(echo "$orphaned_output" | tail -n 1)

if [ "$last_line" = "No packages found." ]; then
    echo -e "${GREEN}No orphaned packages found on the system${NC}"
else
    # Display warning before removing packages
    echo -e "${RED}Warning: Before proceeding, check the list of packages to be removed.${NC}"

    # Use awk to extract package names and remove them with zypper
    echo "$orphaned_output" | awk 'NR > 4 && /^\S/ {print $5}' | xargs zypper rm -u

    # Display success message in green
    echo -e "${GREEN}Orphaned packages successfully removed.${NC}"
fi
