# MySQL InnoDB Cluster DBA Automation Toolkit

## Overview

This project is a production-ready, shell-based automation toolkit for administering
multiple MySQL InnoDB Clusters on Oracle Linux servers.

It centralizes **health checks, performance diagnostics, security operations,
backup & disaster recovery, and incident response** behind a single control script.

The toolkit is designed following **real DBA runbooks** and best practices used in
high-availability MySQL environments.

---

## Features

### Cluster Operations

- InnoDB Cluster health & role checks
- Primary / failover validation
- Replication lag detection

### Performance & Stability

- Slow query analysis (Performance Schema)
- Long-running transaction detection
- Deadlock inspection
- Connection spike monitoring
- Index health & table fragmentation checks

### Backup & Disaster Recovery

- Hot backups using Percona XtraBackup
- Backup preparation & restore
- Automated test restore on standby server
- Backup size trend monitoring

### Security & User Management

- User creation & removal
- Privilege grants & revocation
- Password rotation
- Account locking / unlocking
- Security & privilege audits

### System Monitoring

- CPU, RAM, disk usage
- InnoDB buffer pool & IO health

---

## Project Structure

```text
mysql-dba-toolkit/
├── main.sh
├── config/
├── checks/
├── advanced/
├── backup/
├── users/
├── monitoring/
├── lib/
└── README.md
```

## Requirements

- MySQL 8.x with InnoDB Cluster
- MySQL Shell (`mysqlsh`)
- Percona XtraBackup
- Oracle Linux 8/9
- Bash 4+

## Usage

```bash

Copy code

`./main.sh status ./main.sh slow ./main.sh backup ./main.sh user-audit ./main.sh long-trx`

```

Run `./main.sh --help` for full command list.

## Security Notes

    - Passwords are never hardcoded
    - MySQL login paths (mysql_config_editor) are recommended
    - Follows least-privilege principles

Author

Sherif Mohamed

Senior MySQL / PostgreSQL DBA & Data Engineer
