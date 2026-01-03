#!/bin/bash

# =========================================
# SSH Remote Server Setup Script
# =========================================
# This script configures SSH access using
# two SSH public keys and installs Fail2Ban
# =========================================

set -e

SSH_DIR="$HOME/.ssh"
AUTHORIZED_KEYS="$SSH_DIR/authorized_keys"

PUB_KEY_1="PASTE_PUBLIC_KEY_1_HERE"
PUB_KEY_2="PASTE_PUBLIC_KEY_2_HERE"

echo "Step 1: Creating .ssh directory"
mkdir -p "$SSH_DIR"
chmod 700 "$SSH_DIR"

echo "Step 2: Adding SSH public keys"
touch "$AUTHORIZED_KEYS"

grep -qxF "$PUB_KEY_1" "$AUTHORIZED_KEYS" || echo "$PUB_KEY_1" >> "$AUTHORIZED_KEYS"
grep -qxF "$PUB_KEY_2" "$AUTHORIZED_KEYS" || echo "$PUB_KEY_2" >> "$AUTHORIZED_KEYS"

chmod 600 "$AUTHORIZED_KEYS"

echo "Step 3: Verifying SSH directory permissions"
ls -ld "$SSH_DIR"
ls -l "$AUTHORIZED_KEYS"

echo "Step 4: Installing Fail2Ban (optional security)"
sudo apt update -y
sudo apt install fail2ban -y

echo "Step 5: Enabling Fail2Ban service"
sudo systemctl enable fail2ban
sudo systemctl start fail2ban

echo "Step 6: Checking Fail2Ban status"
sudo systemctl status fail2ban --no-pager

echo "SSH Remote Server Setup Completed Successfully"

## How to run this 
chmod +x setup_ssh_remote_server.sh
./setup_ssh_remote_server.sh

