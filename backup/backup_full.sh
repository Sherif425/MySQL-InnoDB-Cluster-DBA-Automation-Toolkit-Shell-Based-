#!/bin/bash
BACKUP_DIR="/backups/mysql/$(date +%F)"
mkdir -p "$BACKUP_DIR"

xtrabackup \
  --backup \
  --target-dir="$BACKUP_DIR" \
  --user=backup \
  --password=backup_pass
