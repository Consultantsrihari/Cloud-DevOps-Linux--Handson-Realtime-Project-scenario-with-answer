# SSH Remote Server Setup – Hands-On Project 4

## 📌 Project Overview
This hands-on project focuses on setting up a **remote Linux server** and configuring it to allow **secure SSH access** using multiple SSH keys. The objective is to gain foundational Linux and SSH knowledge that is essential for DevOps and Cloud roles.

---

## 🎯 Project Goal
The only required outcome of this project is:
- Successfully SSH into a remote Linux server using **two different SSH key pairs**

---

## 🧩 Problem Statement
You are required to:
1. Provision a remote Linux server on any cloud provider (AWS, DigitalOcean, Azure, etc.)
2. Create **two separate SSH key pairs**
3. Configure the server to accept SSH connections using both keys
4. Connect to the server using:
   ```bash
   ssh -i <path-to-private-key> user@server-ip
   ```
5. Configure ~/.ssh/config to allow SSH access using:
    ```
    ssh <alias>
    ```

## 🛠 Requirements
- Linux-based remote server (Ubuntu preferred)
- Two SSH key pairs
- SSH access verified using both keys
- No private keys pushed to GitHub

## 🚫 Important Security Note

❗ Do NOT push private SSH keys to any public repository.
