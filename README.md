# Born2beRoot

Linux system administration project focused on building and hardening a small virtual server from the ground up.

## What it demonstrates

- User, group, password, and sudo policy management
- SSH-only remote access and basic service hardening
- UFW firewall configuration
- System monitoring with a Bash script
- Practical understanding of Debian/Linux administration fundamentals

## Project contents

- `monitoring.sh` - periodic system report script for CPU, memory, disk, login, network, sudo, and LVM status

## Skills practiced

- Linux administration
- Bash scripting
- Security-minded configuration
- Service monitoring
- 42 project constraints and audit readiness

## Usage

Run the monitoring script on a Linux machine:

```bash
chmod +x monitoring.sh
./monitoring.sh
```

The script is designed to be scheduled with `cron` during the project evaluation.
