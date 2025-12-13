#!/usr/bin/env bash
# ==========================================================
# server-stats.sh
# Linux Server Performance Analyzer
# ==========================================================

echo "===================================================="
echo "          LINUX SERVER PERFORMANCE REPORT"
echo "===================================================="
echo "Timestamp : $(date)"
echo

# ---------------- CPU USAGE ----------------
echo "🔹 CPU USAGE"
read cpu user nice system idle iowait irq softirq steal < /proc/stat

total1=$((user + nice + system + idle + iowait + irq + softirq + steal))
idle1=$((idle + iowait))

sleep 0.5

read cpu user nice system idle iowait irq softirq steal < /proc/stat
total2=$((user + nice + system + idle + iowait + irq + softirq + steal))
idle2=$((idle + iowait))

total_diff=$((total2 - total1))
idle_diff=$((idle2 - idle1))

cpu_usage=$(awk "BEGIN {printf \"%.2f\", (1 - $idle_diff / $total_diff) * 100}")
echo "Total CPU Usage : $cpu_usage %"
echo

# ---------------- MEMORY USAGE ----------------
echo "🔹 MEMORY USAGE"
mem_total=$(awk '/MemTotal/ {print $2}' /proc/meminfo)
mem_available=$(awk '/MemAvailable/ {print $2}' /proc/meminfo)
mem_used=$((mem_total - mem_available))

mem_used_pct=$(awk "BEGIN {printf \"%.2f\", ($mem_used/$mem_total)*100}")

echo "Used  : $((mem_used / 1024)) MB"
echo "Free  : $((mem_available / 1024)) MB"
echo "Usage : $mem_used_pct %"
echo

# ---------------- DISK USAGE ----------------
echo "🔹 DISK USAGE"
df -h --total | awk 'END {
print "Used  : "$3
print "Free  : "$4
print "Usage : "$5
}'
echo

# ---------------- TOP PROCESSES ----------------
echo "🔹 TOP 5 PROCESSES BY CPU USAGE"
ps -eo pid,user,%cpu,%mem,comm --sort=-%cpu | head -n 6
echo

echo "🔹 TOP 5 PROCESSES BY MEMORY USAGE"
ps -eo pid,user,%cpu,%mem,comm --sort=-%mem | head -n 6
echo

# ---------------- STRETCH METRICS ----------------
echo "🔹 OS INFORMATION"
if [ -f /etc/os-release ]; then
  grep PRETTY_NAME /etc/os-release | cut -d= -f2
else
  uname -a
fi
echo

echo "🔹 SYSTEM UPTIME"
uptime -p
echo

echo "🔹 LOAD AVERAGE (1m 5m 15m)"
cat /proc/loadavg | awk '{print $1, $2, $3}'
echo

echo "🔹 LOGGED-IN USERS"
who
echo

echo "🔹 FAILED LOGIN ATTEMPTS"
if [ -f /var/log/auth.log ]; then
  grep -i "failed password" /var/log/auth.log | wc -l
elif [ -f /var/log/secure ]; then
  grep -i "failed password" /var/log/secure | wc -l
else
  echo "Log file not accessible (try sudo)"
fi

echo
echo "===================================================="
echo "            END OF REPORT"
echo "===================================================="
