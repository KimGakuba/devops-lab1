#!/usr/bin/env bash
set -euo pipefail

echo '[1/5] Updating package index...'
apt-get update -y

echo '[2/5] Upgrading existing packages...'
DEBIAN_FRONTEND=noninteractive apt-get upgrade -y

echo '[3/5] Installing nginx, ufw, git, curl...'
apt-get install -y nginx ufw git curl

echo '[4/5] Configuring firewall (UFW)...'
ufw --force reset
ufw default deny incoming
ufw default allow outgoing
ufw allow 22/tcp
ufw allow 80/tcp
ufw allow 443/tcp
ufw --force enable

echo '[5/5] Starting NGINX...'
systemctl enable --now nginx

echo ''
echo 'Provisioning complete!'
echo "Visit http://$(hostname -I | awk '{print $1}') to verify."
