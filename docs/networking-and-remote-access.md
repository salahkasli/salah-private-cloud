# Networking and Remote Access

## Overview

The Ubuntu Server VM is connected to the home network. Tailscale provides a private VPN connection so trusted devices can reach services without exposing them directly to the public internet.

## Immich access

Immich photo synchronization is working when the iPhone is not connected to the VPN.

There is a separate issue when the iPhone connects through the VPN: Immich synchronization does not work in that situation. The cause has not yet been confirmed.

## Basic troubleshooting path

When investigating VPN access, check one layer at a time:

1. Confirm that the iPhone shows as connected in Tailscale.
2. Confirm that the Ubuntu Server device is online in the Tailscale admin view.
3. Check whether the iPhone can reach the server using its Tailscale address.
4. Check whether the Immich service is running on Ubuntu Server.
5. Confirm that the Immich app uses the correct server address.
6. Review Tailscale DNS, route and access-control settings if the connection still fails.

Do not publish private Tailscale IPs, device names, authentication keys, or access tokens in this repository.

## Useful server checks

Check the Tailscale connection:

```bash
tailscale status
```

Check the Immich containers:

```bash
cd ~/immich-app
sudo docker compose ps
```

Check recent Immich logs:

```bash
sudo docker compose logs --tail=100
```

## Current status

- Tailscale is configured.
- Immich synchronization works when the iPhone VPN is disconnected.
- Synchronization through the VPN is not working yet.
- The exact cause still needs to be diagnosed.
