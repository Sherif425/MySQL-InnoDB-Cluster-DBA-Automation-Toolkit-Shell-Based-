#!/bin/bash

mysql <<EOF
SELECT
  trx_id,
  trx_mysql_thread_id,
  trx_started,
  TIMESTAMPDIFF(SECOND, trx_started, NOW()) AS trx_age_sec,
  trx_query
FROM information_schema.innodb_trx
WHERE TIMESTAMPDIFF(SECOND, trx_started, NOW()) > 300
ORDER BY trx_age_sec DESC;
EOF
