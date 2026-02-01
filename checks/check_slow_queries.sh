#!/bin/bash
source ../lib/common.sh
source ../config/clusters.conf

for cluster in "${CLUSTERS[@]}"; do
  IFS='|' read -r NAME HOST PORT USER PASS <<< "$cluster"

  mysql -h"$HOST" -P"$PORT" -u"$USER" -p"$PASS" <<EOF
SELECT
  DIGEST_TEXT,
  COUNT_STAR,
  AVG_TIMER_WAIT/1000000000000 AS avg_sec
FROM performance_schema.events_statements_summary_by_digest
ORDER BY AVG_TIMER_WAIT DESC
LIMIT 10;
EOF
done
