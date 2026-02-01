#!/bin/bash

mysql <<EOF
SELECT
  name,
  COUNT
FROM sys.schema_unused_indexes;

SELECT
  TABLE_SCHEMA,
  TABLE_NAME,
  ENGINE
FROM information_schema.tables
WHERE ENGINE NOT IN ('InnoDB','MyISAM');
EOF
