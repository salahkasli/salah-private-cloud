# Storage Design

## Current layout

The Ubuntu Server VM uses two separate hard drives:

| Storage | Main purpose | Mount point |
|---|---|---|
| 2 TB-class HDD | Immich photos and videos | `/mnt/immich-data` |
| 1 TB-class HDD | Local backup copy | `/mnt/cloud-backup` |

Immich stores its library under:

`/mnt/immich-data/library`

The backup disk contains:

- PostgreSQL backup files under `/mnt/cloud-backup/immich/database`
- A synchronized copy of the Immich library under `/mnt/cloud-backup/immich/media`

## Current backup status

- A daily systemd timer is enabled for database backups and media synchronization.
- The database backup archive passed gzip integrity checking.
- A PostgreSQL dump was restored into an isolated test container. The restored database contained 72 tables and 8,636 asset records.
- A selected original video was copied from the backup and verified with a matching SHA-256 hash.
- A subsequent rsync dry run reported zero files to transfer.

These tests validate one restored media file and the database records. They do not prove that every file is healthy or that a complete Immich application can be recovered.

## Important difference: local backup vs off-site backup

Both disks are inside the same computer. If the computer is stolen, damaged, or affected by a serious electrical problem, both disks may be lost.

The media synchronization is not versioned. It does not use rsync `--delete`, so source deletions are not automatically propagated, but changed files can overwrite their previous destination copies.

## Future improvements

1. Test full Immich application recovery in a separate environment.
2. Add a versioned backup or snapshot strategy.
3. Add another copy on a separate device or in a secure off-site location.
4. Periodically verify that database and media backups can be restored.
