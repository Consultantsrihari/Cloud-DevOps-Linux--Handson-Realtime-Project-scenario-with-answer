#!/usr/bin/env bash
# ==========================================================
# Nginx Log Analyser
# ==========================================================

if [ $# -ne 1 ]; then
  echo "Usage: $0 <nginx-access-log-file>"
  exit 1
fi

LOG_FILE="$1"

if [ ! -f "$LOG_FILE" ]; then
  echo "Error: Log file not found!"
  exit 1
fi

echo "=============================================="
echo "        NGINX LOG ANALYSIS REPORT"
echo "=============================================="
echo

# ---------------- TOP IP ADDRESSES ----------------
echo "🔹 Top 5 IP addresses with the most requests:"
awk '{print $1}' "$LOG_FILE" | sort | uniq -c | sort -nr | head -5 | \
awk '{print $2 " - " $1 " requests"}'
echo

# ---------------- TOP REQUESTED PATHS ----------------
echo "🔹 Top 5 most requested paths:"
awk '{print $7}' "$LOG_FILE" | sort | uniq -c | sort -nr | head -5 | \
awk '{print $2 " - " $1 " requests"}'
echo

# ---------------- TOP STATUS CODES ----------------
echo "🔹 Top 5 response status codes:"
awk '{print $9}' "$LOG_FILE" | sort | uniq -c | sort -nr | head -5 | \
awk '{print $2 " - " $1 " requests"}'
echo

# ---------------- TOP USER AGENTS ----------------
echo "🔹 Top 5 user agents:"
awk -F\" '{print $6}' "$LOG_FILE" | sort | uniq -c | sort -nr | head -5 | \
awk '{print $2 " - " $1 " requests"}'
echo

echo "=============================================="
echo "           END OF ANALYSIS"
echo "=============================================="
