#!/bin/bash
# =========================================================
# MySQL InnoDB Cluster DBA Toolkit - Main Controller
# Author: Sherif Mohamed
# Purpose: Central entry point for DBA operations
# =========================================================

BASE_DIR="$(cd "$(dirname "$0")" && pwd)"

print_usage() {
cat <<EOF

MySQL DBA Toolkit - Usage
========================

CLUSTER & HEALTH CHECKS
----------------------
  status              Check InnoDB Cluster status
  slow                Show top slow queries
  resources           Check CPU, RAM, Disk usage
  innodb              Show InnoDB engine status
  indexes             Check index health

BACKUP & RECOVERY
-----------------
  backup               Take full backup (XtraBackup)
  restore <dir>        Restore backup from directory
  testrestore          Test restore on standby server
  backup-trend         Show backup size growth

ADVANCED DBA CHECKS
-------------------
  replica-lag          Check replication lag
  primary-health       Check PRIMARY / failover status
  long-trx             Detect long-running transactions
  deadlocks            Show latest InnoDB deadlocks
  conn-spikes          Check connection spikes
  fragmentation        Detect table fragmentation
  upgrade-check        MySQL upgrade readiness

USER MANAGEMENT
---------------
  user-create <u> <h> <p>        Create user
  user-grant <u> <h> <db> <pr>   Grant privileges
  user-revoke <u> <h> <db> <pr>  Revoke privileges
  user-rotate <u> <h> <p>        Rotate password
  user-lock <u> <h>              Lock user
  user-unlock <u> <h>            Unlock user
  user-audit                     Audit users & privileges

EXAMPLES
--------
  ./main.sh status
  ./main.sh slow
  ./main.sh backup
  ./main.sh user-create app % StrongP@ss
  ./main.sh user-grant app % appdb SELECT,INSERT
  ./main.sh long-trx

EOF
}

# ---------------------------------------------------------
# Command Router
# ---------------------------------------------------------

case "$1" in

# --- Core checks ---
status)           "$BASE_DIR/checks/check_cluster_status.sh" ;;
slow)             "$BASE_DIR/checks/check_slow_queries.sh" ;;
resources)        "$BASE_DIR/checks/check_resources.sh" ;;
innodb)           "$BASE_DIR/checks/check_innodb.sh" ;;
indexes)          "$BASE_DIR/checks/check_indexes.sh" ;;

# --- Backup & Recovery ---
backup)           "$BASE_DIR/backup/backup_full.sh" ;;
restore)          "$BASE_DIR/backup/restore_backup.sh" "$2" ;;
testrestore)      "$BASE_DIR/backup/test_restore.sh" ;;
backup-trend)     "$BASE_DIR/advanced/check_backup_trend.sh" ;;

# --- Advanced DBA ---
replica-lag)      "$BASE_DIR/advanced/check_replica_lag.sh" ;;
primary-health)   "$BASE_DIR/advanced/check_primary_health.sh" ;;
long-trx)         "$BASE_DIR/advanced/check_long_transactions.sh" ;;
deadlocks)        "$BASE_DIR/advanced/check_deadlocks.sh" ;;
conn-spikes)      "$BASE_DIR/advanced/check_connection_spikes.sh" ;;
fragmentation)    "$BASE_DIR/advanced/check_table_fragmentation.sh" ;;
upgrade-check)    "$BASE_DIR/advanced/upgrade_readiness.sh" ;;

# --- User Management ---
user-create)      "$BASE_DIR/users/create_user.sh" "$2" "$3" "$4" ;;
user-grant)       "$BASE_DIR/users/grant_privileges.sh" "$2" "$3" "$4" "$5" ;;
user-revoke)      "$BASE_DIR/users/revoke_privileges.sh" "$2" "$3" "$4" "$5" ;;
user-rotate)      "$BASE_DIR/users/rotate_password.sh" "$2" "$3" "$4" ;;
user-lock)        "$BASE_DIR/users/lock_unlock_user.sh" "$2" "$3" LOCK ;;
user-unlock)      "$BASE_DIR/users/lock_unlock_user.sh" "$2" "$3" UNLOCK ;;
user-audit)       "$BASE_DIR/users/audit_users.sh" ;;

# --- Help ---
""|-h|--help|help)
  print_usage
  ;;

# --- Unknown ---
*)
  echo "❌ Unknown command: $1"
  print_usage
  exit 1
  ;;
esac
