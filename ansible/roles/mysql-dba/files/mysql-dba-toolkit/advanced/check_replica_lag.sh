#!/bin/bash

mysql <<EOF
SELECT
  MEMBER_HOST,
  COUNT_TRANSACTIONS_REMOTE_IN_APPLIER_QUEUE AS lag_txn
FROM performance_schema.replication_group_member_stats;
EOF
