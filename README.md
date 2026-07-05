# Born2beRoot

Born2beRoot is a Linux system-administration project from the 42 curriculum. The goal is to configure a small virtual server with strict security rules, clear user management, and repeatable monitoring.

This repository contains the monitoring script used during evaluation and documents the operational knowledge behind the project.

## What it covers

- Linux server installation and basic hardening
- User, group, password, and sudo policy management
- SSH access configuration
- UFW firewall rules
- LVM awareness and system resource monitoring
- Scheduled reporting with `cron`
- Audit-style explanation of every configuration choice

## Monitoring script

`monitoring.sh` prints a compact server status report with:

- Architecture and kernel version
- Physical CPU cores and virtual processors
- RAM usage
- Disk usage
- CPU utilization
- Last reboot information
- LVM status
- Active TCP connections
- Logged-in users
- IP and MAC address
- Sudo command count

## Run

```bash
chmod +x monitoring.sh
./monitoring.sh
```

During the project, this script is normally scheduled through `cron` and broadcast with `wall`.

## Technical highlights

- Uses standard Linux tools such as `uname`, `free`, `df`, `top`, `last`, `lsblk`, `ss`, `users`, `hostname`, `ip`, and `journalctl`
- Formats system data into an audit-friendly report
- Keeps the implementation dependency-free and shell-native
- Reinforces the relationship between security policy and observable system state

## Skills demonstrated

- Linux administration
- Shell scripting
- Security-first configuration
- Monitoring and operational visibility
- Explaining infrastructure choices clearly under evaluation

## Notes

This project is less about writing a large codebase and more about proving that the server was configured intentionally, securely, and in a way that can be inspected.
