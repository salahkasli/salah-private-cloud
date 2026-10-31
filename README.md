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
- **Storage:** Separate mounted volumes for application data and database backups
- **Automation:** Scheduled database backups using systemd

## Project Objectives

- Build a reliable personal cloud for photos and videos.
- Practice Linux and infrastructure administration.
- Understand virtualization, storage, networking, and containerization.
- Implement and test backup and recovery procedures.
- Document technical decisions and troubleshooting lessons.
- Develop practical skills relevant to Cloud and Systems Administration roles.

## Documentation

Technical documentation will be added progressively as each component is verified.

Planned topics include:
- Infrastructure architecture
- Hardware inventory
- Proxmox VE and Ubuntu Server configuration
- Storage management
- Docker and Immich deployment
- Tailscale remote connectivity
- Backup and recovery procedures
- Troubleshooting and operational lessons

## Project Status

**In progress.** The virtualization platform, Ubuntu Server VM, Immich deployment, storage mounts, remote connectivity, and scheduled database backup have been configured. Further testing and documentation are ongoing.

## Security

No passwords, authentication tokens, private keys, database dumps, or personal media should be committed to this repository.

Internal network details will be documented only when necessary.
