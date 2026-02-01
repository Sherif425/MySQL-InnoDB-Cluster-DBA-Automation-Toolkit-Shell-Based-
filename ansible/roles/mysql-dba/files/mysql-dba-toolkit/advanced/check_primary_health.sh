#!/bin/bash

mysql <<EOF
SELECT
  MEMBER_HOST,
  MEMBER_ROLE,
  MEMBER_STATE
FROM performance_schema.replication_group_members;
EOF
