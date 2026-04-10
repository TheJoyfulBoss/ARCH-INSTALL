#!/usr/bin/env bash
set -e 

source /tmp/install.conf

BASE_PACKAGES="
networkmanager 
git
base-devel
python
python-pip
vim
nvim
sudo
ufw

hyprland
waybar
alacritty
wofi
mako
xdg-desktop-portal-hyprland
pipewire
pipewire-pulse
wireplumber
grim
slurp
wl-clipboard
swaylock-effects
swayidle
ttf-dejavu
noto-fonts-emoji
"
;;

echo "======= Sytem Profile ======="
echo "1) Pentesting"
echo "2) Digital Forensice"
echo "3) Networking"
echo "4) Server"
echo "5) General Use"

echo 
read -rp "Select profile [1-5]: " choice

case "$choice" in 
	1)
	  PROFILE="Pentesting"
	  PACKAGES="
nmap
masscan
whois
dnsutil
amass
burpsuite
sqlmap
nikto
gobuster
ffuf
wpscan
metasploit
exploitdb
john
hashcat
hydra
medusa
cewl
aircrack-ng
wireshark-qt
tcpdump
bettercap
netcat
socat
rlwrap
impacket
gdb
radare2
binwalk
foremost
"
	  ;;
	2)
	  PROFILE="Digital Forensics"
	  PACKAGES="
sleuthkit
autopsy
testdisk
foremost
exiftool
volatility3
"
	  ;;
	3)
	  PROFILE="Networking"
	  PACKAGES="
net-tools
tcpdump
wireshark-qt
traceroute
nmap
bind
openssh
openvpn
ethtool
bridge-utils
"
	  ;;
	4)
	  PROFILE="Server"
	  PACKAGES="
nginx
openssh
"
	  ;;
	5)
	  PROFILE="General Use"
	  PACKAGES=""
	  ;;
	*)
	  echo "Invalid choice"
	  exit 1
	  ;;
esac

#Save profile to config file
echo "PROFILE=$PROFILE" >> /tmp/install.conf 

echo
echo "Selected profile: $PROFILE"
echo "Packages to be installed: "
echo "$PACKAGES"

read -rp "PRoceed with installation? (y/N): " confirm
[[ "$confirm" == "y" ]] || exit 1

# Install packages in chroot
arch-chroot /mnt pacman -syu --noconfirm $BASE_PACKAGES

if [[ -n "$PACKAGES" ]]; then
	arch-chroot /mnt pacman -syu --noconrifm $PACKAGES
fi 

# Enable services 
case "&PROFILE" in
	Pentesting)
		arch-chroot /mnt systemctl enable gdm
		arch-chroot /mnt systemctl enable NetworkManager
