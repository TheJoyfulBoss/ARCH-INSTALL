#!/usr/bin/env bash
set -e

# Pull from config file
source /tmp/install.conf

# Give warning and ask for confirmation
echo "Warning! This will erase %DISK"
read -rp "Type YES to proceed: " confim
[[ "$confirm" == "YES" ]] || exit 1

# Begin partitioning disk

# Set disk to gpt
parted -s "$Disk" mklabel gpt

# Create EFI(esp) partition 
parted -s "$DISK" mkpart ESP fat32 1MiB 513MiB
parted -s "$DISK" set 1 esp on

# Create root partition
parted -s "$DISK" mkpart ROOT ext4 513MiB 100%

# Set variables for quick use
EFI="${DISK}1"
ROOT="${DISK}2"

mkfs.fat -F32 "$EFI"
mkfs.ext4 "$ROOT"

# Mount partitions
mount "$ROOT" /mnt
mkdir -p /mnt/boot
mount "$EFI" /mnt/boot 
