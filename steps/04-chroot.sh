#!/usr/bin/env bash
set -e 

# Move config file to mounted system
cp /tmp/install.conf /mnt/tmp/install.conf

cat <<'EOF' > /mnt/root/post.sh
#!/usr/bin/env bash
set -e

source /tmp/install

ln -sf /usr/share/zoneinfo/UTC /etc.localtime
hwclock --systohc

echo "$HOSTNAME" > /etc/hostname
EOF

chmod +x /mnt/root/post.sh