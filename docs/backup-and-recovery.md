# Backup and Recovery

## Why backups matter

A private cloud must protect both its application data and its database. A backup is useful only if it can be restored successfully.

## Current backup setup

A daily systemd timer runs a script that checks both disks, temporarily stops the Immich server, creates a compressed PostgreSQL dump, tests it with gzip, synchronizes the Immich library to the backup disk with rsync, keeps the seven newest database dumps, and starts the Immich server again.

- Database dumps: `/mnt/cloud-backup/immich/database`
- Media copy: `/mnt/cloud-backup/immich/media`

The media synchronization uses rsync without `--delete`. A dry run after synchronization reported zero files to transfer.

## Recovery tests completed

### Media recovery

A video was copied from the backup media directory to a temporary recovery folder. The SHA-256 hashes of the backup file and recovered copy matched exactly.

This confirms that the selected video was recovered byte-for-byte. It does not verify every media file.

### PostgreSQL database recovery

The October 31, 2026 database dump was restored into a separate temporary PostgreSQL container using the same Immich PostgreSQL image as the live deployment.

The restored database contained:
- 72 tables.
- 8,636 asset records.
- 1 user record.
- 1 album record.

At the time of comparison, the live database contained 8,651 asset records. The difference of 15 records is consistent with the live database having changed after the backup was created.

The restore test was isolated from the live database. It verified that the SQL dump could be imported and queried. It did not verify that a separate Immich application could start successfully against the restored database and media.

## Important limitations

The data disk and backup disk are both inside the same physical computer. This protects against some individual disk problems, but not against loss of the whole machine, theft, fire or major electrical damage.

The rsync command does not use `--delete`, so it does not automatically remove destination files when they are deleted from the source. However, this is not a versioned backup: a changed file can replace the previous destination copy.

A successful gzip test checks archive integrity, not whether PostgreSQL can restore the dump. The isolated restore test provides stronger evidence for database recoverability, but full application-level recovery remains untested.

## Next recovery improvements

1. Test full Immich application recovery in a separate environment, using a compatible application version and the restored database and media.
2. Set up another copy on a different device or in a secure off-site location.
3. Consider versioning or snapshots to protect against accidental changes and deletion.
4. Repeat recovery tests periodically.

Do not test recovery by overwriting the only working Immich installation. Preserve the original data and use a separate test environment.

## Backup checklist

- [x] Daily database backup is scheduled.
- [x] Media library synchronization is configured.
- [x] Latest compressed database archive passed gzip integrity checking.
- [x] Selected original media file restored and SHA-256 verified.
- [x] PostgreSQL dump restored into an isolated test container.
- [ ] Full Immich application recovery tested.
- [ ] Versioned media backup is configured.
- [ ] Off-site copy is configured.
- [ ] Recovery steps are documented and repeatable.
