#!/bin/bash

# -------------------------------------------------------------------
# Script Name: permission-fix.sh
# Description: Recursively changes ownership of the ../vendor directory
#              to the specified user and group.
# Usage: ./permission-fix.sh
# -------------------------------------------------------------------

# ------------------------- Configuration --------------------------

# Default user and group. Modify these if needed.
USER="www-user"
GROUP="www-user"

# Directory whose permissions will be changed
TARGET_DIR="../vendor"

# ------------------------- Functions -----------------------------

# Function to display messages
log() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1"
}

# Function to check if a command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# ------------------------- Main Script ---------------------------

# Check if 'chown' command is available
if ! command_exists chown; then
    log "Error: 'chown' command not found. Please install it and try again."
    exit 1
fi

# Check if the target directory exists
if [ ! -d "$TARGET_DIR" ]; then
    log "Error: Directory '$TARGET_DIR' does not exist."
    exit 1
fi

# Determine if the script is run as root
if [ "$(id -u)" -ne 0 ]; then
    SUDO_CMD="sudo"
    # Check if sudo is available
    if ! command_exists sudo; then
        log "Error: 'sudo' is required but not installed."
        exit 1
    fi
else
    SUDO_CMD=""
fi

# Execute the chown command
log "Changing ownership of '$TARGET_DIR' to '$USER:$GROUP' recursively..."
$SUDO_CMD chown -R "$USER":"$GROUP" "$TARGET_DIR"

# Check if chown was successful
if [ $? -eq 0 ]; then
    log "Success: Ownership changed to '$USER:$GROUP'."
    exit 0
else
    log "Error: Failed to change ownership."
    exit 1
fi
