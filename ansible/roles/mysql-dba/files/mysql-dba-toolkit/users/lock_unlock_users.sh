#!/bin/bash

USER="$1"
HOST="$2"
ACTION="$3" # LOCK or UNLOCK

if [[ "$ACTION" != "LOCK" && "$ACTION" != "UNLOCK" ]]; then
  echo "Usage: lock_unlock_user.sh <user> <host> LOCK|UNLOCK"
  exit 1
fi

mysql <<EOF
ALTER USER '$USER'@'$HOST' ACCOUNT $ACTION;
EOF

echo "User $USER@$HOST $ACTIONED"
