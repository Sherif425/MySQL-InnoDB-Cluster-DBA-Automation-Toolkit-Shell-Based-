#!/bin/bash
set -e

USER_NAME="$1"
USER_HOST="${2:-'%'}"
PASSWORD="$3"

if [[ -z "$USER_NAME" || -z "$PASSWORD" ]]; then
  echo "Usage: create_user.sh <username> [host] <password>"
  exit 1
fi

mysql <<EOF
CREATE USER IF NOT EXISTS '$USER_NAME'@'$USER_HOST'
IDENTIFIED BY '$PASSWORD'
PASSWORD EXPIRE INTERVAL 90 DAY
FAILED_LOGIN_ATTEMPTS 5
PASSWORD_LOCK_TIME 1;
EOF

echo "User $USER_NAME@$USER_HOST created successfully."
