#!/usr/bin/env bash
set -e

CONFIG_FILE="/tmp/install.conf"

echo "=== Arch Install Script ==="

lsblk -d -o NAME,SIZE,TYPE | grep disk
echo
read -rp "Select disk (e.g. /dev/nvme0n1): " DISK

[[ -b "$DISK" ]] || {echo "invalid disk"; exit 1; }

read -rp "Please enter a username: " USERNAME

read -rp "Please enter a hostname: " HOSTNAME

cat <<EOF > "$CONFIG_FILE"
DISK=$DISK
USERNAME=$USERNAME
HOSTNAME=$HOSTNAME
EOF

echo
echo "Summary:"
echo "Disk: $DISK"
echo "Username: $USERNAME"
echo "Hostname: $HOSTNAME"

read -rp "Continue? (y/N): " confirm
[[ "$confirm" == "y" ]] || exit 1