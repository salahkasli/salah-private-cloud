# Storage Design

## Current layout

The Ubuntu Server VM uses two separate hard drives:

| Storage | Main purpose | Mount point |
|---|---|---|
| 2 TB-class HDD | Immich photos and videos | `/mnt/immich-data` |
| 1 TB-class HDD | Database backup files | `/mnt/cloud-backup` |

Immich stores its library under:

`/mnt/immich-data/library`

Database backup files are stored under:

`/mnt/cloud-backup/immich/database`

## Important difference: storage vs backup

Having two disks is useful, but both disks are inside the same computer. If the computer is stolen, damaged, or affected by a serious electrical problem, both disks may be lost.

A safer long-term plan is to keep another copy of important data on a separate device or in a secure off-site location.

## Current backup status

- A daily systemd timer is enabled for database backups.
- A backup archive has passed a gzip integrity check.
- A full database restore test is still pending.
- A separate backup plan for the complete photo and video library still needs to be tested.

## Future improvements

1. Test restoring the database from a backup.
2. Back up the Immich library to a separate device.
3. Add an off-site copy for important files.
4. Periodically check that backups can actually be restored.
