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

More documentation will be added as each part is configured and tested.

## Project Status

**In progress.** Proxmox, the Ubuntu Server VM, Immich, storage mounts, and Tailscale are configured. A daily systemd job creates database backups and synchronizes the Immich library to the second internal HDD. Archive integrity checks have passed; database restore testing and off-site backup are still pending.

## Security

No passwords, authentication tokens, private keys, database dumps, or personal media should be committed to this repository.

Internal network details will be documented only when necessary.
