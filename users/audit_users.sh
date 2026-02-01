#!/bin/bash

echo "=== Users with SUPER or ALL PRIVILEGES ==="
mysql <<EOF
SELECT
  GRANTEE,
  PRIVILEGE_TYPE
FROM information_schema.USER_PRIVILEGES
WHERE PRIVILEGE_TYPE IN ('SUPER','ALL PRIVILEGES');
EOF

echo
echo "=== Users with % Host (Risky) ==="
mysql <<EOF
SELECT user, host
FROM mysql.user
WHERE host = '%';
EOF

echo
echo "=== Password Expiration Status ==="
mysql <<EOF
SELECT
  user,
  host,
  password_expired,
  password_last_changed
FROM mysql.user;
EOF
