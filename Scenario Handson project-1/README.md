# 🖥️ Linux Server Performance Analyzer

A simple and portable **Bash script** that analyzes Linux server performance metrics such as CPU, memory, disk usage, and running processes.

This project is ideal for **Linux beginners, DevOps engineers, SREs, and Cloud engineers** to understand how servers expose performance data internally.

---

## 🎯 Project Goal

Build a script named `server-stats.sh` that can:

- Analyze server performance
- Run on any Linux system
- Display system health clearly in terminal

---

## ✅ Features Implemented

### Core Requirements
- ✅ Total CPU usage
- ✅ Memory usage (Used vs Free with percentage)
- ✅ Disk usage (Used vs Free with percentage)
- ✅ Top 5 processes by CPU usage
- ✅ Top 5 processes by memory usage

### ⭐ Stretch Features
- ✅ OS version
- ✅ System uptime
- ✅ Load average
- ✅ Logged-in users
- ✅ Failed login attempts

---

## ▶ How to Run

```bash
chmod +x server-stats.sh
./server-stats.sh


**## Sample Output**

LINUX SERVER PERFORMANCE REPORT

CPU Usage        : 6.42 %
Memory Used      : 1340 MB (35.20 %)
Disk Usage       : 24 %

Top CPU Process  : java
Top MEM Process  : nginx

OS               : Ubuntu 22.04 LTS
Uptime           : up 3 days, 4 hours
Load Average     : 0.12 0.08 0.05
Logged Users     : 2
Failed Logins    : 3

