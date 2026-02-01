#!/bin/bash

USER="$1"
HOST="$2"
NEW_PASS="$3"

if [[ -z "$USER" || -z "$HOST" || -z "$NEW_PASS" ]]; then
  echo "Usage: rotate_password.sh <user> <host> <new_password>"
  exit 1
fi

mysql <<EOF
ALTER USER '$USER'@'$HOST'
IDENTIFIED BY '$NEW_PASS'
PASSWORD EXPIRE INTERVAL 90 DAY;
EOF

echo "Password rotated for $USER@$HOST"
