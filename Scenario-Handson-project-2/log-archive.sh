#!/usr/bin/env bash
# ==========================================================
# log-archive.sh
# Log Archive Tool - Scenario Handson Project 2
# ==========================================================

set -e

# ---------------- VALIDATION ----------------
if [ $# -ne 1 ]; then
  echo "Usage: log-archive <log-directory>"
  exit 1
fi

LOG_DIR="$1"

if [ ! -d "$LOG_DIR" ]; then
  echo "Error: Directory '$LOG_DIR' does not exist."
  exit 1
fi

# ---------------- VARIABLES ----------------
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
ARCHIVE_DIR="$HOME/log_archives"
ARCHIVE_NAME="logs_archive_${TIMESTAMP}.tar.gz"
LOG_FILE="$ARCHIVE_DIR/archive.log"

# ---------------- CREATE ARCHIVE DIR ----------------
mkdir -p "$ARCHIVE_DIR"

# ---------------- ARCHIVE LOGS ----------------
tar -czf "$ARCHIVE_DIR/$ARCHIVE_NAME" "$LOG_DIR" 2>/dev/null

# ---------------- LOG ARCHIVE INFO ----------------
echo "[$(date)] Archived logs from $LOG_DIR to $ARCHIVE_NAME" >> "$LOG_FILE"

# ---------------- SUCCESS MESSAGE ----------------
echo "✅ Logs successfully archived!"
echo "📦 Archive file : $ARCHIVE_DIR/$ARCHIVE_NAME"
echo "📝 Log updated  : $LOG_FILE"
