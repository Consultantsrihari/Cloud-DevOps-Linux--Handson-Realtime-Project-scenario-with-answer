# SSH Remote Server Setup – Solution Guide

This document contains the complete step-by-step solution to configure a remote Linux server for SSH access using two SSH key pairs.

---

## 📌 Table of Contents
- [Step 1: Provision a Remote Linux Server](#step-1-provision-a-remote-linux-server)
- [Step 2: Create Two SSH Key Pairs (Local Machine)](#step-2-create-two-ssh-key-pairs-local-machine)
- [Step 3: Connect to the Server Initially](#step-3-connect-to-the-server-initially)
- [Step 4: Prepare SSH Directory on the Server](#step-4-prepare-ssh-directory-on-the-server)
- [Step 5: Add Public SSH Keys to authorized_keys](#step-5-add-public-ssh-keys-to-authorized_keys)
- [Step 6: Verify SSH Access Using Both Keys](#step-6-verify-ssh-access-using-both-keys)
- [Step 7: Configure SSH Alias (Local Machine)](#step-7-configure-ssh-alias-local-machine)
- [Step 8: Connect Using SSH Alias](#step-8-connect-using-ssh-alias)
- [Step 9: Install and Configure Fail2Ban (Optional)](#step-9-install-and-configure-fail2ban-optional)
- [Step 10: Final Validation](#step-10-final-validation)

---

## Step 1: Provision a Remote Linux Server

Create a Linux server using any cloud provider:
- AWS EC2 (Ubuntu 20.04 / 22.04)
- DigitalOcean Droplet
- Azure Virtual Machine

Ensure:
- Server has a public IP address
- Port 22 (SSH) is allowed in firewall/security group
- A sudo-enabled user exists (e.g., `ubuntu`, `ec2-user`)

---

## Step 2: Create Two SSH Key Pairs (Local Machine)

Generate two SSH key pairs on your local machine:

```bash
ssh-keygen -t rsa -b 4096 -f ~/.ssh/project4_key1
ssh-keygen -t rsa -b 4096 -f ~/.ssh/project4_key2
```
### This creates:
- project4_key1 / project4_key1.pub
- project4_key2 / project4_key2.pub

## Step 3: Connect to the Server Initially

Connect using default credentials provided by the cloud provider:
```
ssh user@server-ip
```
## Step 4: Prepare SSH Directory on the Server

On the remote server:
```
mkdir -p ~/.ssh
chmod 700 ~/.ssh
```
## Step 5: Add Public SSH Keys to authorized_keys

Open the authorized keys file:
```
nano ~/.ssh/authorized_keys
```
Paste the contents of:

- project4_key1.pub

- project4_key2.pub

Set proper permissions:
```
chmod 600 ~/.ssh/authorized_keys
```

## Step 6: Verify SSH Access Using Both Keys

From your local machine, test both keys:
```
ssh -i ~/.ssh/project4_key1 user@server-ip
ssh -i ~/.ssh/project4_key2 user@server-ip
```
Both connections should succeed.

## Step 7: Configure SSH Alias (Local Machine)

Edit SSH configuration file:
```
nano ~/.ssh/config
```
Add the following:
```
Host project4-key1
  HostName server-ip
  User user
  IdentityFile ~/.ssh/project4_key1

Host project4-key2
  HostName server-ip
  User user
  IdentityFile ~/.ssh/project4_key2
```

Apply permissions:
```
chmod 600 ~/.ssh/config
```
## Step 8: Connect Using SSH Alias
```
ssh project4-key1
ssh project4-key2
```
## Step 9: Install and Configure Fail2Ban (Optional)

On the server:
```
sudo apt update
sudo apt install fail2ban -y
sudo systemctl enable fail2ban
sudo systemctl start fail2ban
```

Verify:
```
sudo fail2ban-client status
```
## Step 10: Final Validation

 - Remote server provisioned

 - Two SSH key pairs created

 - Both keys added to the server

 - SSH access verified

 - SSH aliases working

 - Fail2Ban installed (optional)
