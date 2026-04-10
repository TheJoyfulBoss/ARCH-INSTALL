#!usr/bin/env bash
set -e

arch=chroot /mnt grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB

/mnt grub-mkconfig -o /boot/grub/grub.cfg