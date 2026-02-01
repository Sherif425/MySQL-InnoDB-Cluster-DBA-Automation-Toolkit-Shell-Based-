#!/bin/bash
source ../lib/common.sh
source ../config/clusters.conf

for cluster in "${CLUSTERS[@]}"; do
  IFS='|' read -r NAME HOST PORT USER PASS <<< "$cluster"

  echo "[$(timestamp)] Checking cluster: $NAME"

  mysqlsh --sql \
    --host="$HOST" --port="$PORT" \
    --user="$USER" --password="$PASS" <<EOF
SELECT MEMBER_ID, MEMBER_ROLE, MEMBER_STATE
FROM performance_schema.replication_group_members;
EOF
done
