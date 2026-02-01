ssh test-server "
  systemctl stop mysqld &&
  rm -rf /var/lib/mysql/*
"

rsync -av /backups/mysql/latest test-server:/tmp/restore

ssh test-server "
  xtrabackup --prepare --target-dir=/tmp/restore &&
  xtrabackup --copy-back --target-dir=/tmp/restore &&
  systemctl start mysqld
"
