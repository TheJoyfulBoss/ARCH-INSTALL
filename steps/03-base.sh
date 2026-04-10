#!/usr/bin/env bash
set -e 

# Check if disk if disk is mounted
mountpoint -q /mnt || { echo "Disk not mounted"; exit 1; }

# Install important base packages
pacstrap /mnt base linux linux-firmware sudo grub efibootmgr

# Generate fstab
genfstab -U /mnt >> /mnt etc fstab
