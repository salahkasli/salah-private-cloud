# Troubleshooting Notes

This page collects safe first checks for common issues in the private cloud.

## 1. Check the virtual machine

In Proxmox, confirm that the Ubuntu Server VM is running and that its console is accessible.

## 2. Check Ubuntu Server

Check system uptime and resource usage:

```bash
uptime
free -h
df -h
```

Check mounted storage:

```bash
lsblk -f
findmnt
```

## 3. Check Immich

Go to the Compose project directory:

```bash
cd ~/immich-app
```

Check container status:

```bash
sudo docker compose ps
```

Read recent logs:

```bash
sudo docker compose logs --tail=100
```

## 4. Check scheduled database backups

Check the timer:

```bash
systemctl status immich-backup.timer
systemctl list-timers --all
```

Check the backup service logs:

```bash
journalctl -u immich-backup.service --since today
```

The service name above should match the installed systemd unit.

## 5. Check Tailscale

Check whether the server is connected:

```bash
tailscale status
```

For iPhone synchronization problems through the VPN, follow the checks in [Networking and Remote Access](networking-and-remote-access.md).

## Troubleshooting approach

1. Identify exactly what is failing.
2. Check the layer closest to the problem.
3. Read the relevant service logs.
4. Change one thing at a time.
5. Test again and record the result.

Never share passwords, private keys, authentication tokens, or unredacted logs containing sensitive information.
