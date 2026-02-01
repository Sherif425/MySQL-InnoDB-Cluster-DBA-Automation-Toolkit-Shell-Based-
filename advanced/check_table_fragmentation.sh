#!/bin/bash

mysql <<EOF
SELECT
  table_schema,
  table_name,
  data_length/1024/1024 AS data_mb,
  data_free/1024/1024 AS free_mb
FROM information_schema.tables
WHERE data_free > 1024*1024
ORDER BY data_free DESC;
EOF
