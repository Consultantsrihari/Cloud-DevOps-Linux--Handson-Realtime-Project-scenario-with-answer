# ❓ Question: Nginx Log Analyser

## 📌 Problem Statement

Write a simple **command-line tool** to analyze Nginx access logs.

The goal of this project is to practice **shell scripting fundamentals** by parsing and analyzing real-world log files using standard Linux command-line tools.

---

## 📂 Log File Format

The Nginx access log contains the following fields:

- IP address
- Date and time
- HTTP request method and path
- Response status code
- Response size
- Referrer
- User agent

Example log line:
45.76.135.253 - - [16/Aug/2024:10:06:48 +0000] "GET /api/v1/users HTTP/1.1" 200 512 "-" "Mozilla/5.0"


---

## 🎯 Requirements

Create a shell script that reads the Nginx access log file and outputs:

1. Top 5 IP addresses with the most requests
2. Top 5 most requested paths
3. Top 5 response status codes
4. Top 5 user agents

---

## 📊 Expected Output Format
Top 5 IP addresses with the most requests:
- 45.86.135.253 - 9000 requests
- 132.93.143.9 - 690 requests
- 198.128.95.113 - 59 requests
- 53.224.43.189 - 50 requests
- 198.128.94.113 - 30 requests


---

## 🧠 Solution Approach

This project is solved using **standard Linux text-processing utilities**:

| Command | Purpose |
|------|-------|
| `awk` | Extract specific fields from log lines |
| `sort` | Sort extracted data |
| `uniq -c` | Count unique occurrences |
| `head` | Limit output to top 5 |
| `sed` | (Optional) Clean or format output |

---

## 🛠️ How Each Requirement Is Solved

### 1️⃣ Top 5 IP Addresses
- Count occurrences
- Sort by count

```bash
awk '{print $1}' access.log | sort | uniq -c | sort -nr | head -5
```
### 2️⃣ Top 5 Requested Paths
```bash
awk '{print $7}' access.log | sort | uniq -c | sort -nr | head -5
```

### 3️⃣ Top 5 Status Codes
```bash
awk '{print $9}' access.log | sort | uniq -c | sort -nr | head -5
```
### 4️⃣ Top 5 User Agents

Extract user agent using double-quote delimiter
```bash
awk -F\" '{print $6}' access.log | sort | uniq -c | sort -nr | head -5
```

### ▶ How to Run the Script
```bash
1. Make executable

chmod +x nginx-log-analyser.sh

2. Run the tool

./nginx-log-analyser.sh access.log
```

### 🎓 What This Project Teaches

- Real-world log analysis

- Shell scripting basics

- Text parsing techniques

- Linux command-line mastery

- DevOps & SRE troubleshooting mindset

### 🚀 Real-World Use Cases

- Detect suspicious IP activity

- Identify most-used APIs

- Monitor HTTP error trends

- Analyze traffic patterns

- Prepare logs for security audits
