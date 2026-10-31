# Personal Private Cloud

A hands-on homelab project to build, operate, secure, and document a private cloud for personal photos, videos, and files.

This project is also a practical learning portfolio covering Linux administration, virtualization, containers, storage, networking, backups, and troubleshooting.

## Current Infrastructure

- **Hardware:** Lenovo ThinkCentre M720s SFF
- **Hypervisor:** Proxmox VE
- **Operating System:** Ubuntu Server
- **Containers:** Docker Engine and Docker Compose
- **Photo Management:** Immich
- **Remote Access:** Tailscale
- **Storage:** Separate mounted volumes for Immich data and local backups
- **Automation:** Daily database backup and media synchronization using systemd

## Project Objectives

- Build a reliable personal cloud for photos and videos.
- Practice Linux and infrastructure administration.
- Understand virtualization, storage, networking, and containerization.
- Implement and test backup and recovery procedures.
- Document technical decisions and troubleshooting lessons.
- Develop practical skills relevant to Cloud and Systems Administration roles.

## Documentation

- [Infrastructure architecture](docs/architecture.md)
- [Hardware inventory](docs/hardware-inventory.md)
- [Storage design and backup status](docs/storage-design.md)
- [Proxmox VE](docs/proxmox.md)
- [Ubuntu Server](docs/ubuntu-server.md)
- [Docker and Immich](docs/docker-immich.md)
- [Backup and recovery](docs/backup-and-recovery.md)
- [Networking and remote access](docs/networking-and-remote-access.md)
- [Troubleshooting](docs/troubleshooting.md)
- [Security basics](docs/security.md)
- [Operational scripts](scripts/README.md)

## Project Status

**In progress.** Proxmox, the Ubuntu Server VM, Immich, storage mounts, and Tailscale are configured. Daily database backups and media synchronization to a second internal HDD are running. A media file was restored and verified with matching SHA-256 hashes. A PostgreSQL backup was restored into an isolated test container; 72 tables and 8,636 asset records were readable. Full application-level recovery and off-site backup are still pending.

## Security

No passwords, authentication tokens, private keys, database dumps, or personal media should be committed to this repository.

Internal network details will be documented only when necessary.
