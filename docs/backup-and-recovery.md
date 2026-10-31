# Backup and Recovery

## Why backups matter

A private cloud must protect both its application data and its database. A backup is useful only if it can be restored successfully.

## Current backup setup

A daily systemd timer runs a script that checks both disks, temporarily stops the Immich server, creates a compressed PostgreSQL dump, tests it with gzip, synchronizes the Immich library to the backup disk with rsync, keeps the seven newest database dumps, and starts the Immich server again.

- Database dumps: `/mnt/cloud-backup/immich/database`
- Media copy: `/mnt/cloud-backup/immich/media`

The latest scheduled run completed successfully. The compressed database archives passed the gzip integrity check.

## What is not yet complete

- A full PostgreSQL restore test has not yet been completed.
- A media restore test has not yet been completed.
- An off-site backup is planned, but has not been configured.
- The media synchronization is not versioned and does not keep historical versions of changed files.

## Important limitations

The data disk and backup disk are both inside the same physical computer. This protects against some individual disk problems, but not against loss of the whole machine, theft, fire or major electrical damage.

The rsync command does not use `--delete`, so it does not automatically remove destination files when they are deleted from the source. However, this is not a versioned backup: a changed file can replace the previous destination copy.

A successful gzip test checks archive integrity, not whether PostgreSQL can restore the dump.

## Recovery plan to complete

1. Confirm that a recent database backup exists.
2. Restore the database in a separate test environment, following the official Immich restore procedure.
3. Verify that Immich starts and the expected data is available.
4. Restore selected photos and videos from the media copy in a safe test location.
5. Set up another copy on a different device or in a secure off-site location.

Do not test recovery by overwriting the only working Immich installation. Preserve the original data and use a separate test environment.

## Backup checklist

- [x] Daily database backup is scheduled.
- [x] Media library synchronization is configured.
- [x] Latest compressed database archive passed gzip integrity checking.
- [ ] Database restore has been tested.
- [ ] Media restore has been tested.
- [ ] Versioned media backup is configured.
- [ ] Off-site copy is configured.
- [ ] Recovery steps are documented and repeatable.
