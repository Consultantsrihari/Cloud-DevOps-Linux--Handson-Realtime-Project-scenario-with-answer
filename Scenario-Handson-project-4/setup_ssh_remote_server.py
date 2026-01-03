#!/usr/bin/env python3

import os
import subprocess

SSH_DIR = os.path.expanduser("~/.ssh")
AUTHORIZED_KEYS = os.path.join(SSH_DIR, "authorized_keys")

PUB_KEY_1 = "PASTE_PUBLIC_KEY_1_HERE"
PUB_KEY_2 = "PASTE_PUBLIC_KEY_2_HERE"

def run(cmd):
    subprocess.run(cmd, shell=True, check=True)

def main():
    print("Step 1: Creating .ssh directory")
    os.makedirs(SSH_DIR, exist_ok=True)
    os.chmod(SSH_DIR, 0o700)

    print("Step 2: Adding SSH public keys")
    open(AUTHORIZED_KEYS, "a").close()

    with open(AUTHORIZED_KEYS, "r+") as f:
        keys = f.read()
        if PUB_KEY_1 not in keys:
            f.write(PUB_KEY_1 + "\n")
        if PUB_KEY_2 not in keys:
            f.write(PUB_KEY_2 + "\n")

    os.chmod(AUTHORIZED_KEYS, 0o600)

    print("Step 3: Installing Fail2Ban (optional)")
    run("sudo apt update -y")
    run("sudo apt install fail2ban -y")

    print("Step 4: Enabling Fail2Ban")
    run("sudo systemctl enable fail2ban")
    run("sudo systemctl start fail2ban")

    print("Step 5: Checking Fail2Ban status")
    run("sudo systemctl status fail2ban --no-pager")

    print("SSH Remote Server Setup Completed Successfully")

if __name__ == "__main__":
    main()



### How to run this 
```
chmod +x setup_ssh_remote_server.py
python3 setup_ssh_remote_server.py
```
