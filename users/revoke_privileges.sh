#!/bin/bash

USER="$1"
HOST="$2"
DB="$3"
PRIVS="$4"

mysql <<EOF
REVOKE $PRIVS ON $DB.* FROM '$USER'@'$HOST';
FLUSH PRIVILEGES;
EOF

echo "Revoked [$PRIVS] from $USER@$HOST"
