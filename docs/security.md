# Security Basics

## Access

- Use strong, unique passwords.
- Use SSH keys where practical and protect private keys.
- Keep Proxmox and Ubuntu management access private.
- Use Tailscale for trusted remote access instead of exposing management services directly to the internet.
- Give accounts only the access they need.

## Updates

- Keep Proxmox, Ubuntu Server, Docker and Immich updated.
- Read release notes before major application updates.
- Back up important data before making significant changes.

## Secrets and private data

Never commit these items to GitHub:

- Passwords or API tokens
- SSH private keys
- Tailscale authentication keys
- The Immich `.env` file
- Database dumps or backup archives
- Personal photos, videos or documents
- Private network details that are not needed for the documentation

A private repository is not a secure place for secrets. Treat every Git commit as something that could become public later.

## Backups

Keep database backups and photo/video backups separate from the live application data. Plan an additional copy outside the server and test recovery regularly.

## Security status

This page describes basic practices for the project. It is not a security audit or a claim that every control has been independently tested.
