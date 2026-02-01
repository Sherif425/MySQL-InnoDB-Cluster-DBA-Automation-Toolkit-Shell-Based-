systemctl stop mysqld

xtrabackup \
  --copy-back \
  --target-dir="$1"

chown -R mysql:mysql /var/lib/mysql
systemctl start mysqld
