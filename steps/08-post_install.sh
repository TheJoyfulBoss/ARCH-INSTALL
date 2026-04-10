#!/usr/bin/env bash
set -e

source /tmp/install.conf

echo "Installing Dot Files"

USER_HOME="/home/$USERNAME"

# Fore safety, make sure git is installed
arch-chroot /mnt pacman -S --noconfirm git

arch-chroot /mnt git clone https://github.com/end-4/dots-hyprland.git

# Run dot file install
arch-chroot /mnt bash -c "
	cd /tmp/dotfiles
	chmod +x install
	
	sudo -u $USERNAME ./install
"

# Cleanup Files
arch-chroot /mnt rm -rf /tmp/dotfiles
