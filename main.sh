#!/bin/bash

case "$1" in
  status)     ./checks/check_cluster_status.sh ;;
  slow)       ./checks/check_slow_queries.sh ;;
  resources)  ./checks/check_resources.sh ;;
  innodb)     ./checks/check_innodb.sh ;;
  backup)     ./backup/backup_full.sh ;;
  restore)    ./backup/restore_backup.sh "$2" ;;
  testrestore)./backup/test_restore.sh ;;
  perf)       ./monitoring/performance_snapshot.sh ;;
  indexes)    ./checks/check_indexes.sh ;;
  user-create)   ./users/create_user.sh "$2" "$3" "$4" ;;
  user-grant)    ./users/grant_privileges.sh "$2" "$3" "$4" "$5" ;;
  user-revoke)   ./users/revoke_privileges.sh "$2" "$3" "$4" "$5" ;;
  user-rotate)   ./users/rotate_password.sh "$2" "$3" "$4" ;;
  user-lock)     ./users/lock_unlock_user.sh "$2" "$3" LOCK ;;
  user-unlock)   ./users/lock_unlock_user.sh "$2" "$3" UNLOCK ;;
  user-audit)    ./users/audit_users.sh ;;
  *)
    echo "Usage: $0 {status|slow|resources|innodb|backup|restore|testrestore|perf|indexes|user-create|user-grant|user-revoke|user-rotate|user-lock|user-unlock|user-audit}"
    
    echo "USER usage: ./main.sh user-create app_user % StrongP@ss123
         ./main.sh user-grant app_user % appdb SELECT,INSERT
         ./main.sh user-lock app_user %
        ./main.sh user-audit"
    ;;

esac
