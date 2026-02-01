#!/bin/bash

USER="$1"
HOST="$2"
DB="$3"
PRIVS="$4"

if [[ -z "$USER" || -z "$HOST" || -z "$DB" || -z "$PRIVS" ]]; then
  echo "Usage: grant_privileges.sh <user> <host> <db> <privileges>"
  echo "Example: SELECT,INSERT,UPDATE"
  exit 1
fi

mysql <<EOF
GRANT $PRIVS ON $DB.* TO '$USER'@'$HOST';
FLUSH PRIVILEGES;
EOF

echo "Granted [$PRIVS] on $DB to $USER@$HOST"
