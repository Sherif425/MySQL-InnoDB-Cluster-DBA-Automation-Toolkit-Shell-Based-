#!/bin/bash

BACKUP_DIR="/backups/mysql"

du -sh "$BACKUP_DIR"/* | sort -h
