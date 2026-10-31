# Ubuntu Server

## Role in this project

Ubuntu Server is the operating system running inside a Proxmox virtual machine. It hosts Docker, Immich, storage mount points and scheduled database backups.

## Current setup

- Ubuntu Server runs as a VM on Proxmox VE.
- The VM is connected to the home network.
- Its network address is reserved through the router.
- Two additional storage volumes are mounted for Immich data and database backups.

Private IP addresses, disk UUIDs and other machine-specific details are intentionally not published here.

## Useful Linux administration commands

Check system information:

```bash
hostnamectl
```

Check IP addresses:

```bash
ip address
```

Check disks and mount points:

```bash
lsblk -f
df -h
```

Check memory:

```bash
free -h
```

Check running services:

```bash
systemctl --type=service --state=running
```

Update installed packages:

```bash
sudo apt update
sudo apt upgrade
```

## Good practices

- Use SSH keys where practical and protect private keys.
- Keep the system updated.
- Use sudo instead of working as root for normal administration.
- Check disk space and service status regularly.
- Keep a record of important configuration changes.
