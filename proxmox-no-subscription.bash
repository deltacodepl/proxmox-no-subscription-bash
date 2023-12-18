#!/bin/bash
mv /etc/apt/sources.list.d/pve-enterprise.list /etc/apt/sources.list.d/pve-enterprise.list.bak
mv /etc/apt/sources.list.d/ceph.list /etc/apt/sources.list.d/ceph.list.bak
mv /etc/apt/sources.list /etc/apt/sources.list.bak

cat <<EOL | tee /etc/apt/source.list
deb http://ftp.debian.org/debian bookworm main contrib
deb http://ftp.debian.org/debian bookworm-updates main contrib

# Proxmox VE pve-no-subscription repository provided by proxmox.com,
# NOT recommended for production use
deb http://download.proxmox.com/debian/pve bookworm pve-no-subscription

# security updates
deb http://security.debian.org/debian-security bookworm-security main contrib
EOL

cat <<EOL | tee /etc/apt/source.list.d/pve-no-subscription.list
deb http://download.proxmox.com/debian/pve bookworm pve-no-subscription
EOL

cat <<EOL | tee /etc/apt/source.list.d/ceph.list
deb http://download.proxmox.com/debian/ceph-reef bookworm no-subscription
EOL

sudo apt update
sudo apt upgrade -y
sudo apt dist-upgrade -y
