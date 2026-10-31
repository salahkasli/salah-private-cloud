# Backup and Recovery

## Why backups matter

A private cloud must protect both its application data and its database. A backup is useful only if it can be restored successfully.

## Current backup setup

- A systemd timer is enabled to run a daily Immich database backup.
- Database backup files are stored on the separate backup volume.
- A generated compressed backup archive passed a gzip integrity check.

## What is not yet complete

- A full database restore test has not yet been completed.
- The complete Immich photo and video library still needs a separate, tested backup plan.
- An off-site backup is planned, but has not been configured yet.

## Important limitation

The data disk and backup disk are both inside the same physical computer. This protects against some individual disk problems, but not against loss of the whole machine, theft, fire or major electrical damage.

## Recovery plan to complete

1. Confirm that a recent database backup exists.
2. Follow the official Immich restore procedure in a safe test environment.
3. Verify that Immich starts and the expected data is available.
4. Create and test a separate backup of the photo and video library.
5. Set up another copy on a different device or in a secure off-site location. This is a pending improvement.

Do not test recovery by overwriting the only working Immich installation. Use a separate test environment and preserve the original data.

## Backup checklist

- [ ] Database backup runs on schedule.
- [ ] Backup files are checked regularly.
- [ ] Database restore has been tested.
- [ ] Photo and video library backup is configured.
- [ ] Off-site copy is configured.
- [ ] Recovery steps are documented and repeatable.
