#!/usr/bin/env bash
set -e

source /tmp/install.conf

arch-chroot /mnt useradd -m -G wheel "$USERNAME"

echo "Please set a password for $USERNAME"
arch-chroot /mnt passwd "$USERNAME"

arch-chroot /mnt bash -c "echo '%wheel ALL=(ALL) All' >> /etc/sudoers"