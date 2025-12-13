# 🗂️ Log Archive Tool  
### Scenario Handson Project-2

A simple **CLI-based Bash tool** to archive system logs by compressing them with date and time.  
This helps keep systems clean while retaining logs in a compressed format for future reference.

---

## 🎯 Project Objective

Build a command-line tool that:
- Accepts a log directory as input
- Compresses logs into a `.tar.gz` file
- Stores archives in a separate directory
- Logs archive history with timestamp

---

## 📌 Why This Project Matters

On Linux systems, logs (usually stored in `/var/log`) grow continuously.  
Without proper management, they can:
- Consume disk space
- Impact system performance
- Become difficult to manage

This tool demonstrates **real-world DevOps & Linux administration practices** such as:
- Log rotation concepts
- Archiving strategies
- CLI tool development
- File and directory handling

---

## ⚙️ Requirements Covered

- ✅ Runs from the command line
- ✅ Accepts log directory as an argument
- ✅ Compresses logs into `.tar.gz`
- ✅ Stores archives in a new directory
- ✅ Uses date & time in archive name
- ✅ Logs archive history to a file

---

## ▶ How to Use

### 1. Make script executable
```bash
chmod +x log-archive.sh
```

### 2. Run the tool
```bash
./log-archive.sh /var/log
```
💡 You need sudo to access system logs:
```bash
sudo ./log-archive.sh /var/log
```
---

## 📦 Output Example

### ✅ Archive File Created

logs_archive_20240816_100648.tar.gz

---

### 📁 Archive Location
~/log_archives/


All compressed log archives are stored in this directory.  
Each archive filename contains the **date and time**, making it easy to track when the logs were archived.

---

### 📝 Archive Log File
~/log_archives/archive.log

This file maintains a **history of all archive operations**.

---

### 📄 Sample `archive.log` Entry
Archived logs from /var/log to logs_archive_20240816_100648.tar.gz


---

## 📘 What the Archive Log Contains

Each entry in `archive.log` records:

- 📅 **Date & Time** of the archive
- 📂 **Source log directory** (e.g., `/var/log`)
- 📦 **Archive file name**

This makes auditing and troubleshooting much easier in real production systems.

---

## 🧠 Summary

✔ Logs are compressed into a timestamped `.tar.gz` archive  
✔ Archives are stored separately to keep the system clean  
✔ Every archive operation is logged for future reference  
✔ Tool follows real-world **Linux & DevOps best practices**

---

## 🚀 Real-World Use Cases

- Cleaning up old system logs safely  
- Preparing logs for backup or compliance  
- Automating log maintenance with cron  
- Learning how log rotation and archiving works internally  

---
