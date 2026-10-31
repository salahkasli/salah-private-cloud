# Operational Scripts

Small scripts for checking and maintaining the private cloud.

## Available script

### `check-status.sh`

Runs read-only checks for:

- Docker and Docker Compose availability
- Docker daemon access
- Immich and backup storage mount points
- The scheduled database backup timer
- Tailscale command status

Run it on the Ubuntu Server VM:

```bash
bash scripts/check-status.sh
```

If Docker permission is denied, run:

```bash
sudo bash scripts/check-status.sh
```

The script does not restart services or change configuration. A successful check does not prove that a backup can be restored or that the full photo library is protected.
